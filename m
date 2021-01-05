Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D43C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 00:35:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B11E22256F
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 00:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B11E22256F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XbFr74ox4jkMMsA/uHGpeAfljPyr6DBp2STE0IiNpVs=; b=Jn2rrf6f+Lki4n5NIWrblhurF
	aEFuIe9C2baP4ouLWFZwfOTRd97NE7cx0Z/mxZDTaetPXgiY25Zq1Jkrrg0GOosQUhiAaHBVsFAiL
	6QGhOmO8pYeixC4PLNZ9LmMAU9Xa7McAF68VDSfJqVXKMnGUb3btsjtr5JzxAxQoTAtQwmAGhYQ6V
	6DESYxTglE4zoowlZ8RDACVLtnfMJP+/m5Sk/kZzcPtSUC9/xcIxut/MiWoW9EhzUHrCXzfuSX3uF
	NjB+0gYy+qPc4xu+t3/Uzjvosf6jvw5eV+CT/PE0iQG3XYP7WrgV8BrsP80kPTWj4cP1Q2/QvxGDy
	DOMGD3Txg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwaJi-0001aE-UB; Tue, 05 Jan 2021 00:35:18 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwaJe-0001Xk-6o; Tue, 05 Jan 2021 00:35:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id EC5471F44AC8
Date: Mon, 4 Jan 2021 19:35:01 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v6 4/4] drm/panfrost: Add mt8183-mali compatible string
Message-ID: <20210105003501.GB5061@kevin>
References: <20210105001119.2129559-1-drinkcat@chromium.org>
 <20210105081111.v6.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
MIME-Version: 1.0
In-Reply-To: <20210105081111.v6.4.I5f6b04431828ec9c3e41e65f3337cec6a127480d@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_193514_359910_7A697BAC 
X-CRM114-Status: UNSURE (   8.45  )
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
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hoegsberg@chromium.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8865398246876117721=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8865398246876117721==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Content-Disposition: inline


--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Add support for MT8183's G-57 Bifrost.

G72

--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl/ztDQACgkQ/v5QWgr1
WA2AdxAArG57a2smC1BqpcY/2qFinFJAiNzzzEHZaiFh89MTBkKz49V0yC5rs/PY
dyXf1wapDtnDbsaFc4C6Lna6Gx6HFqzhvVEIT2iIQBoMNOnBkZzjiPIu/8O8xa8V
VGgT+1H/PCLBdOwYZvHEJoooYSNJXRULSeubjUhxbsJ7oZZr81J5jPlE/fMKuiRn
yUSvOQPVsC4eX5QlskHDGIaylRkmy7Nh+Nb0aTlY3zvMJUYtRgIp0aK3iukurDnD
mI+TQPQ1WiTRwHGb23TUdbOPVDdDyvtfowI1QnqT7d2ULkevCvbsmJdl52Vg0Wpa
e3UFe5GH41gMhXQR0h5Ey/sggKnEI63eq+nUwdkeiyV+sZVf1ZC6iKggOmUtw3vo
CbxPvANIznLg/sa700BwVdwr1VPr132IzgNoLfPRGH2AyE4Yv5NFlQXqeFoTsA1x
CjAXGl8gr42aeyg5q0KKXNzi1uYEb+mU2HGbvjcdSA/c4IN+/dpSJ6zcJYLQCewf
sha63em98yGgTilRup2yqxImd1MvK2rZyeY4BeDrxeCQ4kUsyUNXAT+uWjProoTW
uYH0l98CFSBvsFoD4Sn5LrMOc9mhuVBMLsSW6TwewOXL72KcoTDOlAyqZ4FWhISe
Oa+r7uL+z9RConR+eIr1rHH9fBFO46S+kFls0a42L/L6OsjHFSk=
=Q9kh
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--


--===============8865398246876117721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8865398246876117721==--

