Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD7BC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 11:45:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41B8220738
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 11:45:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3gtOBr+U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="RzHAuAEm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41B8220738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A1gkzEyY5nSfIpW1XbxUdkIoReRbcZnKaVzvlL7swYA=; b=3gtOBr+UpVHkV+YzyjqhFvCCq
	hk4soJdRiJIfjVPHvMx1+XPh5qy6T695nOe6Jlaa6w3ghpBAigmSWJDXW8ToDmLBkpItrgAevF+O+
	eF7PZHzMvx8Mp1vt3J8bufa+pSVVQdrThsCqUOAnTAA8ot16LIx2TRXtYf3NAC1dBrjkpBWoikDL6
	gUevk6LSohMGYAxEzrmLvs3pittEugMs6f9vKXSWh2WKOAMxVizPT0DG/ZQa/fQlxIiFWWdSfuAre
	gIPdcCrdS+v4iybH/42uzZ4T0i3B0aHAqPX95aVeCXY1nWmDJjrvRS7q3CAivH2Yfm1//tMFmzF0Y
	jLunLVoyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2vNW-0007b1-J0; Tue, 04 Aug 2020 11:45:10 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2vNU-0007aV-Ot; Tue, 04 Aug 2020 11:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596541499;
 bh=UjeGRcpAgU30m1QdVj6HpRLtLtjKyy+eXr8UxSxBC2I=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=RzHAuAEm5lW/tClgy18cHL4hru1l1rMwSaAg//nTlObJHSu8DjA/V03PKGCdtt/mj
 T2MH7rcGqzYMtXfVNdCpiT11+p7KPYC4Iiw8hRjFKrjP+OWkvAoraG7P0SsX1EbhGB
 LPMGOfHaMbvx29DNPnOzjGXzvu3LMHBk2eQ8dgTQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.144.119] ([217.61.144.119]) by web-mail.gmx.net
 (3c-app-gmx-bs08.server.lan [172.19.170.59]) (via HTTP); Tue, 4 Aug 2020
 11:53:28 +0200
MIME-Version: 1.0
Message-ID: <trinity-a7ac2cda-c860-47ac-8451-fd6d7338882f-1596534808733@3c-app-gmx-bs08>
From: Frank Wunderlich <frank-w@public-files.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Aw: Re: Re: Re: [PATCH v2 1/5] drm/mediatek: config component
 output by device node port
Date: Tue, 4 Aug 2020 11:53:28 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAAOTY_-H3L=uJNJRF1VedbwXNwY2N-q4F6A-NsdNwbQswG0D-Q@mail.gmail.com>
References: <20200728111800.77641-1-frank-w@public-files.de>
 <20200728111800.77641-2-frank-w@public-files.de>
 <CAAOTY_8nm0KDHFzOX9+qTTHOUd0Vik063J+rScu_y-hTBTkrCQ@mail.gmail.com>
 <trinity-2bdb3521-256a-4d4d-928a-be9b8c179d4c-1596355539029@3c-app-gmx-bs58>
 <CAAOTY__TsqrfRX-z+DE0+X_UzxBqChJ+VdyQG6z9N6Qr4bn2Kg@mail.gmail.com>
 <trinity-b0ca2ee2-259a-4a1e-86ee-63b093202060-1596451368067@3c-app-gmx-bap36>
 <CAAOTY_-H3L=uJNJRF1VedbwXNwY2N-q4F6A-NsdNwbQswG0D-Q@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:QwdKZO4FiZV3+KlU6ywm3BaZAsIcXy9QykjG6eYTalqdFz5Z5rxuwafBGe4o0IIGaE/T3
 IM18u3freut5DoyOqZTzGUJNsmyDgRhxC3X8mikKs4z7ufPjdoazrFfJp12P3/XW4D6QtZt9Fw4S
 n9IE8ebt6D9QQN0ZDGeEs9dm16iwIlNJiu5t2KeTT7U+OPz9gEAfunzYykwy0pZvI0MFblVNRdau
 hnU1lNQGcu5o+FktIAric9ivM1nW1PzRBuSe3xi+LxVzugqmzLTtvoj6x3o4FuEW4JasicgSKdTC
 Cg=
X-UI-Out-Filterresults: notjunk:1;V03:K0:HSMhLchRKtc=:rBHWREJabF0D0nKyGCMax3
 mgB0vVbS3MYX9wVj1x+dXy9xNRSYuSCB47Q49TvJlEIF8B2xYhSNy7Kr4drWSWS0CCcMz/UJq
 DcceSDx56kUWQD9N8UoZuDpGHxq6uaLy9bCQ7lmyU1cbzK3d8KNAoEpLTqz5SO1nXUonzlFr8
 hPynFyn1ROJnx1s103DH2MGFrS/rx2qJRMVGHnoiHi1Yh6WIp+TSGcLp+j8sto2E2S0ts7BOX
 E3UIjy4hpGC0M/KMZjP24wnuznSdKyaXjDpbhu3inHBnsnpr2MY3MHUSWomdo3KXpsZoDPQBe
 Op9YmCgfBxMTdI9gusujdWE56sQU90nQzjSTmD1echTG+wCIZCOojd2sR21qtioga4877uY/y
 OW9luTt+ozeehCsW7p+6QW56nJrsaMS4hAofnP2J5KGfa7XEOwej93RzE5OSe/lHEci+Sej8Q
 sI5x0nU7101Te5vu9HgqOLqsND3jsj6Ydu7oFk+Jm5SKnOYconSVWk1E4/jkPfh+80ouWGtUW
 2OdoqiaPtWJ65RvguK8bvnynzrMaEaCCoHd0fUP8Mx6IQasE5pVXH/tKoX/My8C/Lkn2B2SQ9
 E6ePs68yTKvCJQ9acZvsP7uSdzjwbOywj84BICln3MxrevCTtOMjUF3PAd8vmgks8hUXWtpcC
 Ant8iRBfXfV1cxdGUSGejTKdFjBbQ9s5HO6EpJCg8Tg7hi79vzWYVLYlIcEMA2pD1ND4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_074509_024463_0D7B9691 
X-CRM114-Status: GOOD (  17.14  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

i've printed the mtk_comp_id after the modification-loops...

[    5.480848] main:
[    5.480851] DDP_COMPONENT_OVL0
[    5.482776] DDP_COMPONENT_RDMA0
[    5.485827] DDP_COMPONENT_COLOR0
[    5.488978] DDP_COMPONENT_BLS
[    5.492206] DDP_COMPONENT_DPI0
[    5.495170] ext:
[    5.498233] DDP_COMPONENT_RDMA1
[    5.500068] DDP_COMPONENT_DPI0

so only the main-path was replaced with DPI at the end. so currently the DSI is not connected (or i move it to ext). have now added new structs for mt7623 with swapped DPI0/DSI0 and commented out the code from Patch 1...compatible was already mt7623 with 2701 as fallback, so no dts-change needed...

now i need to look which changes in dts can be dropped...at least the bls=>dpi, right?

regards Frank

> Gesendet: Montag, 03. August 2020 um 18:27 Uhr
> Von: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>

> Yes, this is what I mean, but I think it need not output to pmw.
> But now I have a solution that you need not to modify binding document.
> Because now mt7623 has a different routing than mt2701, and this
> patch's approach is to use different port setting in each device tree.
> My solution is that these two SoC has different compatible string:
> "mediatek,mt7623-mmsys" and "mediatek,mt2701-mmsys". For now,
> "mediatek,mt2701-mmsys" has its data as
>
> static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
> .main_path = mt2701_mtk_ddp_main,
> .main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
> .ext_path = mt2701_mtk_ddp_ext,
> .ext_len = ARRAY_SIZE(mt2701_mtk_ddp_ext),
> .shadow_register = true,
> };
>
> I think you could create a data for "mediatek,mt7623-mmsys" which has
> a different routing.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
