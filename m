Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEB4C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 07:17:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02093205CB
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 07:17:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EPhDopXD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="lh4ywpSP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02093205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qCnMsZJ8e5meXdW4jQqkLH9RO49ILm0jzpO+jTkqPl8=; b=EPhDopXDzgc28Ew2PNiM7ZIrs
	bzFIh4bOkvrte8T4hWGxYadMoZWgIA9/i3dVssQj9k0Q8Gjn5yXriIFFcH9vLtZEPeVQju59u+hjZ
	oq9Qls4NcUZ4gZ6gsZ/fR/Zu0BZHlJLjhMwdrzklAhEeOTHDE0wK2yp/F6T5VAc4Ikw2vybzcCmHL
	0ZqKKtKhm1Ebiz8MKTQooyFew1+m0o2M6v3scowX4NyFm3mqnd0427kuZ94+7TBYnyBorf0cAJZEt
	a3Ei0/6C4ZGpjJVHt3NOOkA4K684tnyzRFkmedqS0OFpg9XPpDW2AjqkNhsNy8TzZAjSbvONvU8wy
	HDnvnXimQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7vrt-0004Qc-Qt; Tue, 18 Aug 2020 07:17:13 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7vro-0004Mz-KX
 for linux-mediatek@lists.infradead.org; Tue, 18 Aug 2020 07:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1597734987;
 bh=oAd2cewFPaqUFLZ825vpetOfnNifBeng1WfOCc45x7o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lh4ywpSPgTuw2+vKtgXZiBpwaHVsXoWsPYpFSQ5yTaca5iVHubtO2j+pUlSZ+aYLB
 EJ7D6oCT0ibJ5pMymMDm7GDF/aRyZMxMJ4rj9GjhoDyiGSdTUBmg8LhYgdKESQKxDc
 csduBV8n1+LYWN02Vf1EEBmq2/kHQhlhB+f83JLE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.53.43.192] ([185.53.43.192]) by web-mail.gmx.net
 (3c-app-gmx-bap75.server.lan [172.19.172.175]) (via HTTP); Tue, 18 Aug 2020
 09:16:27 +0200
MIME-Version: 1.0
Message-ID: <trinity-bbc9a618-a916-40bb-b144-bffe715646a4-1597734987449@3c-app-gmx-bap75>
From: Frank Wunderlich <frank-w@public-files.de>
To: David Woodhouse <dwmw2@infradead.org>, chunkuang Hu
 <chunkuang.hu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: Aw: Re: [PATCH 1/2] arm: dts: mt7623: move more display-related
 nodes to mt7623n.dtsi
Date: Tue, 18 Aug 2020 09:16:27 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <cefc273c226c93c605f4dc76afa9eb5aacceaf26.camel@infradead.org>
References: <20200807082754.6790-1-linux@fw-web.de>
 <20200807082754.6790-2-linux@fw-web.de>
 <trinity-f5a5deb1-c123-44d7-b7ca-1f7a8dbe1c1c-1596889651064@3c-app-gmx-bap69>
 <CAAOTY_9o_hBWxWBdDoeeJ6zuV4rb4R_yEoN5+L0uHBGMw4Kduw@mail.gmail.com>
 <cefc273c226c93c605f4dc76afa9eb5aacceaf26.camel@infradead.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:1zwmta4pmD/tPLfGTCCkcWs2zRHllJCy6YJ+kiLxsZskXTnr6VI37DUYsFlii4Xb4L08W
 f2dRJpeQO0Xs1eLFfAzuNdy11GpFvoPIlEnBL0LGojAuTwkkdU4u9mDaJ53bY//epXuPgtboJj5e
 wvDFl4BGFQ/pR+khAiwc/2oyW5ZZEormFDLxWYj3P807hxx03892Jyud3Sbff7fo8/rtF9LtPCgf
 PXbFKcG9T23FVEUswYe0ufzVDzP0VnJL8QnXAhUqz94I8tYigJUPnMKNmQGVIm6NKBE/5NvuA2Qx
 JQ=
X-UI-Out-Filterresults: notjunk:1;V03:K0:+cfbgQjm7mI=:SgaOEzSXg+wCJWY5AoxjuP
 otZlxD2w7vmKWZ0OW8VcgB5OgLlWU/wmglcguOXtoDxp+A30SPlQ2PV3NapgExPgxnMkz1PVH
 +lSPdQOfVlKm77RKjzy2JfzQXm1lTm7mfbOfEl4srcL37dLSvM10l+qRv5djodSPI5jUWZO4q
 BzD726N7/qJHoTmMNIaT4Ons7mokzH66J4WNsihDxmehoDi28uBXOxTippUEXXwXLyJlvK/jr
 fv1l/UO5uSeDX9HROqOSHa1Tg7qBBWcCUt0MZL3w/r5xXuMvif67tqtal/AvGspe20BS7UgYm
 +S+jPblDaSLwTd1rT1YIwmka9FRyomNcyoql6ldmvJaLmBedNTlX5py3UYBYnJVT3BPHQ4PF9
 TMT86q/MJUsHxmtLf8NT3wpw8Mje/RwpUiD92s8b2o6md2cZbJ99h2jwheFqq/eQmBeUCUojt
 VUfhOd02amsMdKJS6dwghPXAh3DU+6WNwULDJQmZD8pMCeU4fBcoJCEZuyCXCZBMKGNYaINzI
 gMjau/hDHSBhztJViUijPQHUyOlZ+qR7sL7S0y+8k9fSvZoIU8X4ddcCAYHfz3gZtxQ+vTKNX
 hCngHwksomg/alFbQ+w6B+362elm6LNU7wOIChRHZAroRphhwlVxSHl3YCwvi1Vx/2+6pDUiH
 W02yOGvfIT0+bGM+JSu7/PXsNbI0yN9aNzyJ9cN8P85Mbm35k2ZA1qJ6UPmX25EnZSnY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_031709_012958_DFF4F042 
X-CRM114-Status: GOOD (  20.95  )
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
Cc: devicetree@vger.kernel.org, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

i rebased changes to 5.9-rc1 [1] and include parts from Davids Series in my one.

David: is it ok to squash your mali-commit with mine moving the other display-related nodes and use me as author?

CK Hu/Matthias/Ryder/Sean: is the structure of DTS ok now?

regards Frank

[1] https://github.com/frank-w/BPI-R2-4.14/commits/5.9-hdmi

> Gesendet: Montag, 10. August 2020 um 09:48 Uhr
> Von: "David Woodhouse" <dwmw2@infradead.org>
> Betreff: Re: [PATCH 1/2] arm: dts: mt7623: move more display-related nodes to mt7623n.dtsi
>
> On Sun, 2020-08-09 at 08:16 +0800, Chun-Kuang Hu wrote:
> > I would like to put all device in mt7623.dtsi with some device's
> > status is "disabled" and change its status in platform dtsi.
> > I would like to see all device in mt7623.dtsi because of its name. If
> > you move some device to platform dtsi, we would trace all platform
> > dtsi to find out how many device in mt7623. One day a new platform
> > enable different devices, you would reorganize all these platform
> > dtsi?
>
> No, this isn't "platform dtsi", surely? This is mt7623a and mt7623n
> dtsi for the two different SoCs, and platforms then just include
> mt7623a.dtsi or mt7623n.dtsi as appropriate for the SoC they are using.
>
> If you really want *all* the nodes for both MT7623A and MT7623N chips
> in a single mt7623.dtsi but disabled, could we still have mt7623a.dtsi
> and mt7623n.dtsi for the chips, enabling the nodes that are only-for-A
> or only-for-N, so that each platform doesn't have to do that for
> itself?
>
> Although putting those nodes that exist only in one chip or the other
> directly into the mt7623[an].dtsi still seems to make more sense to
> me.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
