Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9173CC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 16:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8TZw7FeJBmKDJ370Rl4rNJpW9mSF/8K4liV520XZIww=; b=qVOa/TxMo1SAmF
	QoL0iQ3kEr2pt4Ayt+uot18olJ23CS93Sele18nOzPPccygjkQR3UtxJeERkT6osW8aF+vEvGPFsW
	f9D6uv21qL7R5uLeltgA12rKb5uqoq9dc0n5EDDgVGr3u8yMIU5S9Okb2rn69aNhA53Men/QDI7hZ
	4tioSKX7J8nujaB4LCuSEykOA49nCHxi++r+/hYLZ2QbcHxAftXT1Quj3LyNiqwU6rpLnZpfov8qu
	HfOPO3Rq3lYNuW/ylPRl2BcPDnh+S9yidN0Aqfc9frf2MiWJk2YK4dtIAdCGsnwOYWpbywFF7ORG2
	ai2p2eKe2wP1ZTb3W+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njO1h-00FLIq-A1; Tue, 26 Apr 2022 16:26:57 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1njO1g-00FLId-M1; Tue, 26 Apr 2022 16:26:56 +0000
Date: Tue, 26 Apr 2022 09:26:56 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Lecopzer Chen <lecopzer.chen@mediatek.com>, atomlin@redhat.com
Cc: linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-modules@vger.kernel.org, linux-mediatek@lists.infradead.org,
 yj.chiang@mediatek.com
Subject: Re: [PATCH] module: show disallowed symbol name for inherit_taint()
Message-ID: <YmgdUKmfym1/XnhP@bombadil.infradead.org>
References: <20220426042120.9686-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220426042120.9686-1-lecopzer.chen@mediatek.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Can you base your changes on modules-next [0] and resend and Cc
atomlin@redhat.com?

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/log/?h=modules-next

  Luis

On Tue, Apr 26, 2022 at 12:21:20PM +0800, Lecopzer Chen wrote:
> The error log for inherit_taint() doesn't really help to find the symbols
> which violate GPL rules.
> 
> For example,
> if a module has 50 disallowed symbols, the log only shows the content below
> and is duplicated with 50 lines.
>     AAA: module using GPL-only symbols uses symbols from proprietary module BBB.
>     AAA: module using GPL-only symbols uses symbols from proprietary module BBB.
>     ...
> 
> This patch add symbol name to tell the offending symbols explicitly.
> 
> To-be:
>     AAA: module using GPL-only symbols uses symbols SS1 from proprietary module BBB.
>     AAA: module using GPL-only symbols uses symbols SS2 from proprietary module BBB.
>     ...
> 
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> ---
>  kernel/module.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/module.c b/kernel/module.c
> index 6cea788fd965..30973f0d2b7c 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -1372,20 +1372,20 @@ static int verify_namespace_is_imported(const struct load_info *info,
>  	return 0;
>  }
>  
> -static bool inherit_taint(struct module *mod, struct module *owner)
> +static bool inherit_taint(struct module *mod, struct module *owner, const char *name)
>  {
>  	if (!owner || !test_bit(TAINT_PROPRIETARY_MODULE, &owner->taints))
>  		return true;
>  
>  	if (mod->using_gplonly_symbols) {
> -		pr_err("%s: module using GPL-only symbols uses symbols from proprietary module %s.\n",
> -			mod->name, owner->name);
> +		pr_err("%s: module using GPL-only symbols uses symbols %s from proprietary module %s.\n",
> +			mod->name, name, owner->name);
>  		return false;
>  	}
>  
>  	if (!test_bit(TAINT_PROPRIETARY_MODULE, &mod->taints)) {
> -		pr_warn("%s: module uses symbols from proprietary module %s, inheriting taint.\n",
> -			mod->name, owner->name);
> +		pr_warn("%s: module uses symbols %s from proprietary module %s, inheriting taint.\n",
> +			mod->name, name, owner->name);
>  		set_bit(TAINT_PROPRIETARY_MODULE, &mod->taints);
>  	}
>  	return true;
> @@ -1417,7 +1417,7 @@ static const struct kernel_symbol *resolve_symbol(struct module *mod,
>  	if (fsa.license == GPL_ONLY)
>  		mod->using_gplonly_symbols = true;
>  
> -	if (!inherit_taint(mod, fsa.owner)) {
> +	if (!inherit_taint(mod, fsa.owner, name)) {
>  		fsa.sym = NULL;
>  		goto getname;
>  	}
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
