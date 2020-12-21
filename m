Return-Path: <SRS0=ptZs=FZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A59D2C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 02:24:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BBCE224F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 02:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BBCE224F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UFQBeT9maQKmfOPNGC8UvKi0gvd8pOse0DVyraL2oYw=; b=vu7XTRWNQAxBn50XAm6/nZDTb
	n8PmaufuPRad2FzvnU3vYeM6FMOtAGO2jJd6RRZcRzW+XFh+8MnhhgWHM3ak+yBLIHcWxPGRqI0F/
	4JepPZQ0m8/zTHip7tUgtnS+JQmIrJCyAkMt6yfd0RAqeAy7qEGUzu2RLV7ETGCFZkSBa8nUTGM8s
	hUlu6DpUvqqJtRl8fvTf39wLMeSx3MxmHo/NIs78Xdfg0lF+3/O0mzBb8UwgAUdzvPfv/IfXHxqEj
	y//H/HrtHy8xypTDlbp1ZWU9UM2YwtxLSzsCVQyFuGVr7A/XqyVK1+MKsiQVwhxTVZXCZrWcq2mVs
	+XaBhFVaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krAsO-0005MI-He; Mon, 21 Dec 2020 02:24:44 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krAsK-0005LB-V9
 for linux-mediatek@lists.infradead.org; Mon, 21 Dec 2020 02:24:42 +0000
Received: by mail-vk1-xa31.google.com with SMTP id s13so1926098vkb.11
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Dec 2020 18:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MJXbrMtWRBdURyC5I8B7LQNcHTL+iYONIS0ggY++dQQ=;
 b=QrUzix8Fst7ZZDuLtxjMMrLaH2B72HErGInIuInVYVA0GQfIFwcE7K0WMriuFh5FjK
 1ihLhsEd55ovSH88hN/Dt37Nec7f4+WAvtKtDGJCVapniADCjkqXmIzHgQyqJPOX2+Cd
 8JAS/08y99lMnolcGejh4pchDwKb9/ROWTCB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MJXbrMtWRBdURyC5I8B7LQNcHTL+iYONIS0ggY++dQQ=;
 b=uXye2h8rqX8k4blY0auMLuSdLR2lzMr5qCz9h1C+HCBoz7du/877hMmtshiJCOVSlH
 HvPcce12ZDtQoB5C1HDQafQaMlqDysKxZrqLPVli19mCYc3M+gIe52xVHZfvSnH6Icd3
 2rA0pf9bEbpCGe1INVaD0eeVbqJhCUYgOgpNKo4K2ReykTFDr4T124dZ+lq+YBJKAL36
 9Po0lIadN8XNVFoTdSdgWkjpRD+PNBp5mjLKoEsVX18l+93b5mLiztAKOrsIpGww5OMm
 Wv9mGHtUpdrYsvQQ98cpvOy2CrY9l5A+mNaEjUGzW6Hm7n3s1Io8Xz3XRTN2PCTp8P9F
 Rh4w==
X-Gm-Message-State: AOAM531EEFIfCOxuqXK5ZOQQPQ8/Z+AnLDgP763rqkccrM/uAmFhX6bc
 J0Y7ATW9PBl+36luouPdsp+gMmbC3nGYKVpJlKtvYw==
X-Google-Smtp-Source: ABdhPJzscgPKR5t2JXjnNhwUgbK2V4PaGeerZvWez5wkalVhpklNTNAEkqmjlclzi4+3Mva086/apn/FbXVSXBz+d6E=
X-Received: by 2002:a1f:e385:: with SMTP id a127mr11231257vkh.18.1608517478697; 
 Sun, 20 Dec 2020 18:24:38 -0800 (PST)
MIME-Version: 1.0
References: <1605700894-32699-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1605700894-32699-2-git-send-email-hsin-hsiung.wang@mediatek.com>
In-Reply-To: <1605700894-32699-2-git-send-email-hsin-hsiung.wang@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 21 Dec 2020 10:24:27 +0800
Message-ID: <CANMq1KCcso6sCMEeUSkft+UtDO=OjZ=yyY51n5m+2GMBYomzqQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] soc: mediatek: pwrap: use BIT() macro
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_212441_111993_278A6D8B 
X-CRM114-Status: GOOD (  14.65  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Argus Lin <argus.lin@mediatek.com>, Fei Shao <fshao@chromium.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 18, 2020 at 8:08 PM Hsin-Hsiung Wang
<hsin-hsiung.wang@mediatek.com> wrote:
>
> Use a better BIT() marco for the bit definition.
> No functional changes, cleanup only.
>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

> ---
>  drivers/soc/mediatek/mtk-pmic-wrap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index 5d34e8b..c897205 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -27,8 +27,8 @@
>  #define PWRAP_GET_WACS_RDATA(x)                (((x) >> 0) & 0x0000ffff)
>  #define PWRAP_GET_WACS_FSM(x)          (((x) >> 16) & 0x00000007)
>  #define PWRAP_GET_WACS_REQ(x)          (((x) >> 19) & 0x00000001)
> -#define PWRAP_STATE_SYNC_IDLE0         (1 << 20)
> -#define PWRAP_STATE_INIT_DONE0         (1 << 21)
> +#define PWRAP_STATE_SYNC_IDLE0         BIT(20)
> +#define PWRAP_STATE_INIT_DONE0         BIT(21)
>
>  /* macro for WACS FSM */
>  #define PWRAP_WACS_FSM_IDLE            0x00
> --
> 2.6.4
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
