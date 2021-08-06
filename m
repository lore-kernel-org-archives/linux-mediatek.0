Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A148C19F34
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 17:49:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18452610E7
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 17:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18452610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9snUCsyn9ZmrBrBsQ7jReje5pb7DsbEkjLWCSU7faU=; b=dWTzi5Q6zAiY89
	D86YuL39C6oKW/oPUgcTaCEGiga6LVudX2uv1NqKyRvDoNq73Sd88tjimd9PwVRka6SlzpLtFvvz2
	XhCxS6E9XIJi3nbwyh542jimfHzjuZanlQaILjna70DCqF8dXJ9Z8M4W35sG62JJT0AZrR7MJ7rim
	vfPHm4hYOLIsasRvnbQv/Fp/LZX6cBl3ZV+C2LEfYGqpdqT0iooJyVFlxvQ5UgF1XOM/43bZ5NZHt
	QqnoGNIx6szXyA+BzK7TdQzWTcN89J7Zwy7cYWEQemW3y4xrrsn7VelLpzWFHIs/mPPd+hE9amdq+
	HojEEuxpfVAdyAu97ieQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC3yP-00D4B6-TT; Fri, 06 Aug 2021 17:49:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC3yD-00D49r-0X; Fri, 06 Aug 2021 17:49:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A8F1610E7;
 Fri,  6 Aug 2021 17:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628272160;
 bh=T7XbKNjz6J9bdpleiSzEHZfZGDNL3V/Rt8lKFm7vdVI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=qehl2nYGu56NQ47YvZFb3tco6q5uF6+RgLz1Kn3KSngor7+15bJVjupCtFsHtlJm5
 Jgniw7UjdxMvraFBDsq0orNLK92elvMPSHcGjXwkvMA+6fiVbHRqoYqwjc21b+awvV
 /pbrbeMp6W1j4eN3+GBjqMpOTRhW0DFMkiPReSNTSxyBEuKYi/CC0Jacy6WEGThrdH
 tPl/XiPEJxNKmoHE2GN/ndBSeBB64dLJsSgWzq5M4odHaFpnZK9wddB5lxSV552tt4
 k3pGnMXJs13mqRPLQvDtprHOE5jMpGMNF4US0eUt02ghnSVyTw8g+2++lz3J2LXC4L
 mpkbSXSuftc0g==
MIME-Version: 1.0
In-Reply-To: <1627972461-2627-5-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1627972461-2627-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1627972461-2627-5-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v10 4/5] spmi: mediatek: Add support for MT8195
From: Stephen Boyd <sboyd@kernel.org>
Cc: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Henry Chen <henryc.chen@mediatek.com>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 06 Aug 2021 10:49:19 -0700
Message-ID: <162827215909.1975443.852277412377742323@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_104921_114307_376E590E 
X-CRM114-Status: GOOD (  15.35  )
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

Quoting Hsin-Hsiung Wang (2021-08-02 23:34:20)
> From: Henry Chen <henryc.chen@mediatek.com>
> 
> Add spmi support for MT8195.
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>

Missing Signed-off-by from hsin-hsiung.wang here

> ---
> changes since v9:
> - No change.
> ---
>  drivers/spmi/spmi-mtk-pmif.c | 90 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 
> diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
> index 94c45d46ab0c..0c320801c9d5 100644
> --- a/drivers/spmi/spmi-mtk-pmif.c
> +++ b/drivers/spmi/spmi-mtk-pmif.c
> @@ -348,6 +427,14 @@ static const struct pmif_data mt6873_pmif_arb = {
>         .soc_chan = 2,
>  };
>  
> +static const struct pmif_data mt8195_pmif_arb[] = {

This is an array of type pmif_data.

> +       {
> +               .regs = mt8195_regs,
> +               .spmimst_regs = mt8195_spmi_regs,
> +               .soc_chan = 2,
> +       },
> +};
> +
>  static int mtk_spmi_probe(struct platform_device *pdev)
>  {
>         struct pmif *arb;
> @@ -444,6 +531,9 @@ static const struct of_device_id mtk_spmi_match_table[] = {
>         {
>                 .compatible = "mediatek,mt6873-spmi",
>                 .data = &mt6873_pmif_arb,

mt6873_pmif_arb is not an array, see the context header above.

How does this work? Has this been tested?

> +       }, {
> +               .compatible = "mediatek,mt8195-spmi",
> +               .data = &mt8195_pmif_arb,
>         }, {
>                 /* sentinel */
>         },
> -- 
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
