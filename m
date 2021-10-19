Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221D1C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 13:49:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF61C61052
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 13:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF61C61052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LAscC8IAGUiemd7vTmGTwRQK4xnrQN24AkN/58WeBWw=; b=iwYJzsEwgHNjcc
	1jeVlIZu17yDGQGA4og8oR5wlq+g82gOtPFb9deaModrqUuDF0sN05hHd5uy0sswbxrtuFznaA8Q5
	U8G2G/GsOc5OAXWxOUuYQlpab8FFZA2+Dzq43A62dToWn5tVyUnypd1xCIVTgsCs2g6nlJVhQsDDb
	QZV/zModqgyZ3y2A8TSyCpjiCHJUdqk+xzcNa/+8selplbc90ThVSZVy3HuWyXZks8dLZEJoGkdbg
	xWNR7Lyb+Ru9oRuFV7WZcXfiZoLqwVpEByJsqWyNQ3kNLqjj/Vsqu8v9R8ns0l/OVUc/C57FkJvdp
	aK3FMCBwRPd7obqP74dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcpU2-001TFL-I5; Tue, 19 Oct 2021 13:48:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcpTz-001TEs-JF
 for linux-mediatek@lists.infradead.org; Tue, 19 Oct 2021 13:48:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D8DD761052
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Oct 2021 13:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634651326;
 bh=XMC/wPCLR3CBhhlT5pdzczydUVy9/N9xDjzMYHJpisA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ijfMNV9ioaCwxaa30M3Yq4TaeXc3i96YvXXaArSnOhH/FeOJy7ypLXevuBmBXV043
 PO/xyYXFFprgRGbcoHDaatS9L9FAb4dyHuAONpEqMaqKlROEnuUufA2cP+QQUYYvq/
 cLvtXYK+4Foea4Bn7oHRJBKAuHfIoDk7CfglW/We1YtTZdb18XTpE5zJHVJTgoAzwQ
 MmvRMR1xpfQcmwl+mEB+H8t4Y+PfKDeTdKnlhegC/rlH1VUDObWmLen8ZSU2jjuM2/
 /HEwT5gK37hclnzCW8jk74JOVzlPlD34YWxp4DVcomgKvDSKNUlu9xsHyex0Zn9o+6
 Z2WeQHKTqgPRQ==
Received: by mail-ed1-f49.google.com with SMTP id y30so11927815edi.0
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Oct 2021 06:48:46 -0700 (PDT)
X-Gm-Message-State: AOAM5326ddJPr5Zq5fA1MWHC6SrPjb6HepwyfCnqapy/6poKDZNyHU2Y
 gv4PWRbyxD4OJlCMUb3XmBLbb4sABA7fL7THKQ==
X-Google-Smtp-Source: ABdhPJyAfrYlSPnzjG28JymfwvH0BP3fn74QUTfI0oe+sTUWy23ijNdMN4gs6ujRiJQN0RszPk5QghJDBRsUY0PgyKY=
X-Received: by 2002:a05:6402:1778:: with SMTP id
 da24mr53073940edb.318.1634651259310; 
 Tue, 19 Oct 2021 06:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211018101608.3818840-1-tzungbi@google.com>
In-Reply-To: <20211018101608.3818840-1-tzungbi@google.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 19 Oct 2021 08:47:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK9UQ9K+GseF5QtiPW_sHMiupq1HAwDArN6P+H8iBwJ-Q@mail.gmail.com>
Message-ID: <CAL_JsqK9UQ9K+GseF5QtiPW_sHMiupq1HAwDArN6P+H8iBwJ-Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek: rename reset controller
 headers in DT example
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_064847_672702_404595F9 
X-CRM114-Status: GOOD (  15.82  )
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

On Mon, Oct 18, 2021 at 5:16 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> Commit f07c776f6d7e ("arm64: dts: mediatek: Move reset controller
> constants into common location") moves the reset controller headers.
> However, it forgot to rename the DT example in mt8192-afe-pcm.yaml.
>
> Renames the DT example to pass dt_binding_check.
>
> Fixes: f07c776f6d7e ("arm64: dts: mediatek: Move reset controller constants into common location")
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> The patch bases on next-20211018.
>
> In Mark's tree[1], the commit f07c776f6d7e hasn't shown up.
> In Matthias's tree[2], mt8192-afe-pcm.yaml hasn't applied.
>
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
>
> Also, I am not sure if the commit hash "f07c776f6d7e" would change
> or not after it applies to mainline.
>
>  Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Not great as things will break again in the merge window temporarily.
You could just not use the 1 reset define in the example and avoid all
that, but this is fine:

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
