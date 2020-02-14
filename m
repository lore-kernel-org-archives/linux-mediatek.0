Return-Path: <SRS0=lPor=4C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD2BC2BA83
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 08:45:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFFE72187F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 08:45:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nCgV7RIy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MwkIo877"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFFE72187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+rw2x2xbuwIg8e2SJPIjDAgLDn9hSencTCS6t5jFrc=; b=nCgV7RIyWUEp6H
	dZ2kTlevpCUThwjNgtYmh2qQM+WZzdSt766qMIDTv+D9gJr1JJFSeeIlLCpjCAxFFMrxuNQcsBDdM
	9ShoGt3X7zdsRGt4Dkh2ihyS6tqWOYxH9qVIqr0MkTz7+z+1tLQH+nVq+xPdsO2p6OxTlxn//KJB4
	JtitKtvuXuCjMhHL5Z78WrureXIPoQh2GMCDdKPprxXPpAURhatrAidSftUDjpOPQz/qgcJO6Rmm8
	tgIFae/muuVF6jRtAhkzRHTwjGhxvYqa06LkH1PrgKlr5oCNdKIauGffm+0nnsx5D+ObTC1kJBFy4
	dBkp9h51CwBtLKApW26w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2Wag-0007JV-Uy; Fri, 14 Feb 2020 08:44:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2Wa4-0006XA-08; Fri, 14 Feb 2020 08:44:13 +0000
X-UUID: 67a1e62cd7a1428f858d80b00c1b2bea-20200214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=o2bK0SZqMI85CjEk1N9bVcxZhc8pa2z/qRl3UsDcAX4=; 
 b=MwkIo877uq5osuuY4vE5I56SN405iwpxerDFPZQj8b7xxan1QkfejKJ77wFjLWYaL+4A23N6ENoePZGvaPu/DflRrI81NR4MkU/OYXIf9vbcaA3TfIPt0a3wlgRgryTy5RifST2UYbXHFBranzKvm/VqpgCokT3UuuyYrTDrSFw=;
X-UUID: 67a1e62cd7a1428f858d80b00c1b2bea-20200214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 696231823; Fri, 14 Feb 2020 00:44:07 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 14 Feb 2020 00:34:19 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 14 Feb 2020 16:34:03 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 14 Feb 2020 16:32:12 +0800
Message-ID: <1581669243.29925.13.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: fix race condition for HDMI jack status
 reporting
From: CK Hu <ck.hu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 14 Feb 2020 16:34:03 +0800
In-Reply-To: <CA+Px+wW0BWz0-8L_UXJ-OYbwG6W9vmCWRr7kevpk0yokp+NKKg@mail.gmail.com>
References: <20200213153226.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
 <1581664042.20487.4.camel@mtksdaap41>
 <CA+Px+wW0BWz0-8L_UXJ-OYbwG6W9vmCWRr7kevpk0yokp+NKKg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E4F804774C418372C14AAF9660D005786F5B43F8F573AC6B89DAE76E13F0C79D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_004412_085462_2CBCF95C 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
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
Cc: ALSA development <alsa-devel@alsa-project.org>, p.zabel@pengutronix.de,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, Daniel
 Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Dylan Reid <dgreid@google.com>, linux-arm-kernel@lists.infradead.org,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Tzung-Bi:

On Fri, 2020-02-14 at 15:35 +0800, Tzung-Bi Shih wrote:
> On Fri, Feb 14, 2020 at 3:07 PM CK Hu <ck.hu@mediatek.com> wrote:
> > I think sound driver could be removed for some reason, and fn should be
> > set to NULL before sound driver removed. In this case, codec_dev != NULL
> > and fn == NULL.
> 
> No..if you see sound/soc/codecs/hdmi-codec.c, plugged_cb is statically
> allocated.

It looks like that even though sound driver is removed, hdmi driver
would still callback to sound core. This is so weird. After sound driver
is removed, hdmi driver would callback with codec_dev which is invalid.
I think this may cause some problem.

Regards,
CK
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
