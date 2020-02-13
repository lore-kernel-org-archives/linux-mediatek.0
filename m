Return-Path: <SRS0=7p0Y=4B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A11CC352A4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 01:57:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1D3120659
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 01:57:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AaIpJE+0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hne3FsPD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1D3120659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hz5ArPRavBWKhgdvZw9PP0wQJGjv30dPp5Mfc9qhZG0=; b=AaIpJE+0z+wA6F
	FSLcMOvqFhTgLYk1hwQ5COonFdxmZlOkEVEbpaAhlXuT0drU64842u1tQLOE2QQB3rAEAzhHrI8p+
	UZ1RyFEHyScdhqTQwIBpqSDw40/XPjnDRDYTEqHHcHaqO//HUbOL7aWYR3XN5o5UjwH99nhP7SYwv
	FF+YtmOIDc2vQyAru/6iKEQ+Rs3BMwUSUxlH+43WXGB3SH6rPMn5kjB1pNZVNK+LYlpqnFq/zQ3VR
	0pdpDG13DDpOJAwGmXWaMyarMqGVDC1E83jqhQatM6yvlDmALSVZGkcBRxW8zR2EHPxPF2Y0LwTJ6
	YZuOHyVAZ5kMCRMOVFJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j23ks-0004Hf-R1; Thu, 13 Feb 2020 01:57:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j23kp-0004H0-9z; Thu, 13 Feb 2020 01:57:25 +0000
X-UUID: f51863081e5444dd90bc72f7a3b2636f-20200212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SS2WJ9TnlTdWxgp0Ian/hWdeQ6K5JRe2gnRD2HiUUuo=; 
 b=hne3FsPDQO9jeuZ9Tnc+sCBIQjIKoA+2MLp1XYmlv2S9RNIOUMa9d/wgECzF/Aq9pE7mQo7seqIPGY+ZET3B3W3TQm4nQkv93k2TkB6sDKUcFx3BpoN7MKiGX7bdzCDK7aSH0SR6KCRt2M57suGHRfmxkEnuOppdWwgt4l32BR4=;
X-UUID: f51863081e5444dd90bc72f7a3b2636f-20200212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 195385892; Wed, 12 Feb 2020 17:57:17 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Feb 2020 17:57:27 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Feb 2020 09:55:50 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Feb 2020 09:57:18 +0800
Message-ID: <1581559033.14792.9.camel@mtksdaap41>
Subject: Re: [PATCH v2 2/3] drm/mediatek: support HDMI jack status reporting
From: CK Hu <ck.hu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 13 Feb 2020 09:57:13 +0800
In-Reply-To: <CA+Px+wXjC1rchzUGhYYCJVyEbm7RQNFnqf-sQNaky6d82DyLyw@mail.gmail.com>
References: <20200206031752.193298-1-tzungbi@google.com>
 <20200206102509.2.I230fd59de28e73934a91cb01424e25b9e84727f4@changeid>
 <1581495554.22603.2.camel@mtksdaap41>
 <CA+Px+wXjC1rchzUGhYYCJVyEbm7RQNFnqf-sQNaky6d82DyLyw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 242DD775477EA9B69ECE3E92EE470D936050FE8CEE227D1CA21D57919E72DCD62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_175723_355082_5DB19407 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, p.zabel@pengutronix.de, Dylan
 Reid <dgreid@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Tzung-Bi:

On Wed, 2020-02-12 at 19:31 +0800, Tzung-Bi Shih wrote:
> On Wed, Feb 12, 2020 at 4:19 PM CK Hu <ck.hu@mediatek.com> wrote:
> > I think hdmi_conn_detect() and mtk_hdmi_audio_hook_plugged_cb() would be
> > called in different thread. So it's necessary to use a mutex to protect
> > this.
> 
> Thanks for the reminder.  I feel using mutex here is overkill.  Please
> see https://patchwork.kernel.org/patch/11378413/ for my proposed
> solution.
> 

I'm not only consider the race condition of plugged_cb and codec_dev. I
also care about the atomic of mtk_cec_hpd_high() and hdmi->plugged_cb().
If these two function is not an atomic operation, below is an example of
problem:

<Status disconnected>
1. Thread A call mtk_hdmi_audio_hook_plugged_cb()
2. Thread A call mtk_cec_hpd_high() and get disconnected.
<Status connected>
3. Thread B call hdmi_conn_detect()
4. Thread B call mtk_cec_hpd_high() and get connected
5. Thread B callback plugged_cb() with connected
6. Thread A callback plugged_cb() with disconnected (Bug here)

Regards,
CK

> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
