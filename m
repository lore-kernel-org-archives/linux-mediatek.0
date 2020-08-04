Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6D4C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 17:21:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52A5D206C0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 17:21:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l1tqQQkR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="XMFNeBE/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52A5D206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zbYdnjGDEqfd0F7xvP56k5fvLfqNAEwQRsdWXR9m2ec=; b=l1tqQQkRriGuEuMjV0rmlroFF
	Nb3ntqOhYivUPAkd/iPQB1TTnJiupxs7ksYuplvPcGjrKrC02APPFZHl1mFAoe+mSVjprAxt/EU7b
	wDmF1C876yQpNshP3MY1eDN2v/Lzpc5a5kVuKBNE6nwN6AS5Kx6OL/vW99ZwFC1+mDpdvmpJb4Kw0
	uYvxv9lUYkCSa0TTuAsgSyL5mUbpHoisJ9kJNWfpufMihFhDt6/EnnxNgdwL6V63vPclmgOXBMrrN
	OlPUppT6VwcOfpPmcuFO8AauqDIuGr86Jnu1VvM1bcI8tB53WENwTLJJOY1EtWYfltt2dhiLGZuLO
	ImQ+OYaKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k30cU-0000cq-53; Tue, 04 Aug 2020 17:20:58 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k30cR-0000c9-Mx; Tue, 04 Aug 2020 17:20:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596561629;
 bh=Xm96KhWFipnp8fHSl6yjWFA/cv3nb5aR+D9sTB7Q9DQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XMFNeBE/s6ISNUdNbeuMDY9W86xY0QoxQ/+90CVOHJSbw2GwzY7Lb8bKhHtLy+vkk
 Il3LgUtHUPLuOZ6J2PW/Z3GLN4OBms/YUrzYuLn75Vn/Tw5D4DjLj+HopIFt8/9zv/
 zfocukZeUcSPLMQiBXmf0ed+5xmE+bp28Ey+HVKU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.144.119] ([217.61.144.119]) by web-mail.gmx.net
 (3c-app-gmx-bap28.server.lan [172.19.172.98]) (via HTTP); Tue, 4 Aug 2020
 19:20:29 +0200
MIME-Version: 1.0
Message-ID: <trinity-c649c75e-dd0a-4a92-9e88-e8668da0218c-1596561629490@3c-app-gmx-bap28>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Aw: [PATCH v4] net: ethernet: mtk_eth_soc: fix MTU warnings
Date: Tue, 4 Aug 2020 19:20:29 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200804165555.75159-3-linux@fw-web.de>
References: <20200804165555.75159-1-linux@fw-web.de>
 <20200804165555.75159-3-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:e5KOynI+/rmWbuU9ZXSdr2OtpLUfZJDwrtcFmCyHYcfQVIktZj8UP54lT6kmijAyztwFJ
 yl/DkXGXQ9Km7aZjja8OXleAwTwC6f5x+7GrVb8EA4paejLAXDLRv8/fYbZ68ydyCLdtMM3yBdjH
 /q8jD73GgUR48Illv+r2TScJj6C3PviJBHLRqjUg33gd8KhkYp/xVBSvLtdpdbMx44jxft6Hpf85
 HF/O01uWs6rqiEp/w8+rwXYUEwoQOPVwPC426wQnR5ol7MjBq1vZJYL+5VCQiaajwa45QGffs1d+
 VM=
X-UI-Out-Filterresults: notjunk:1;V03:K0:fY8FUHPb9Ek=:Ua9iZ3Yg4RDjnNGD/ZPz/O
 hyYwHgepwofq66laYElGNV1ODrmQDlRHdDec0bu4wjLVSmg9x4bXgTU8kYNwAb3yL4YlcBG7q
 Tf4NFSYvsuux9HJtwMcLQS0fSa5iC2V3lN6C7jexawqn6QJUacH+vXJc503dwVncIlh6TcmRe
 7Ea0Sdven4PLpsNH+cAAwM9N+FfqG0hagPXgYSB+0MIxvGGSNcKc8mXJEzhAUEHZRx7Dxwosa
 M1YShXtqraCNNmNyeQoK17yiThA3lC/1HiGX31LCnSqr2er5/nOSqHplojHViohzu0gG4lWK2
 J9AUbBQZxwApFMX5ZD1xWaUPiMIR/Bpz6sNu2BJJzsf/JmYsjTi/qz8LB/ytj0kSmPvPsxUzz
 HZDQ8163owvPngnqgZvam6MmHCU+YPOlnQzYa5MNgsAQZXWFl/BO1IWCuXPHWPJk/cqPqva5A
 nEttbHAyAUDmVpgAyznV2mz8noGFTZ+om2Vy4gsgCj9doKTVElFOD43X32sIBqlaFo0rcocZa
 eAptwzH4b3tCmk8NX/qXJyjRGNAy9/z3FxhzQDXo3h5CaIuxvGIniDxFSou3xveZZfMo9e8po
 LCN9RojlegcSK9tF0jnhmC56V57vnUXfBknp+S3klp0y+yPPqh/fyfDTK8CbLdPjDusRJhpVl
 chOm+NtXkKLmTLE3TRRyC65EBNoTeOhGSduzTVxIGzFUTTs6ZOdDm3OSa/i6tF9TRgM8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_132055_973125_DAB6E4C8 
X-CRM114-Status: UNSURE (   8.88  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Landen Chao <landen.chao@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrew Lunn <andrew@lunn.ch>, David Airlie <airlied@linux.ie>,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

sorry, send this accidentally while posting my hdmi series v4 (have not deleted patch-file)
just ignore this...it's already merged

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
