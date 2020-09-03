Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A58C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 15:13:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B29F20716
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 15:13:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0BFyvqw7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="m0/ea+7g";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="ju5V+eFD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B29F20716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/Qmy7OeBCiR8e5j0OR5H2ZBPjBGkLXFkXv9oY+nxGg=; b=0BFyvqw7MDi3p6xnCrkVTKDNCm
	PKXF8FFxRdRqM3AUUp82oxx2sg16a3iHWoXJTANEg0jC9EgxR37MWZGu+vizB2LD2wkq9v3zwpEhw
	1v1L+s6s1dGHWrVJFHAi4DMiMqCaeGVX09QW0kBBxDe1rs7JiIYHgZJGzH+p7wv5O3YiyCSHnPXlj
	2fskxzEjvVcvZfA5MG76eCcRp83xMFtRFEaFKl1V7oUPIWXf5LdXaRFHSUmECKwB84m4MljPe1/Lk
	7/S0kwppi95Be9cntr9IPRQcWPFBQgcTQvGdzMt/hp4XuKpac9kttSNiTN4qXSF31tcFDztdBu6jG
	WNH+XPfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDqvW-0003w3-NJ; Thu, 03 Sep 2020 15:13:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDqvV-0003vs-AZ; Thu, 03 Sep 2020 15:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:From:CC:To:Reply-to:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Content-ID:Content-Description;
 bh=8R68AIlx4OoapEV9eDfkFEfV8WdKN6gzUcWaRAO+AvU=; b=m0/ea+7gxUeetdLWdCcgksLIxS
 Rs1SYG6tV5HXZ01rGp80G5Gk/ivJ1fI5btIYga0LotFmTQYRd81VFwg8L4POiXx7M3luwYPSuIJf6
 ljGAn/U9wtitUzitn1V5G36klZHbWxBS55kPdhzLAT8sK5Wr1Z8k1z3ZlsZMwIf5qPI7cMuRbjANG
 BvgW6zjoXYzr3dAaYNbL9lxUPXigoQnIt+v3OI3bYnOJCD7u+FZ/aD/jq9cZQGei7x5+bnbD1Rl4M
 6QVq5/A+VOY97z34b+C7qscrZm46h1xCcI0T3ic727KX+EUNRrEWLxolfPCeWMQ7mJIehaJyPjjud
 IASRp0xA==;
Received: from mout.gmx.net ([212.227.17.21])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDqvN-0008Iv-Gg; Thu, 03 Sep 2020 15:13:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1599145986;
 bh=8R68AIlx4OoapEV9eDfkFEfV8WdKN6gzUcWaRAO+AvU=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=ju5V+eFDh6PEgrnPOr0QG4dPDHRP8EXB9xEmEZ35Tt34QTdcDbdDPdugjQEMt8Zmd
 2TyUxH28mLDbFdcyO8Nw8zMRq3kRF3Dsk3G9UKQGmYRsv47vqgNOzS7NiuDdDGrn7m
 9deaNGGMNozYMJkE2d9nwYzcm03+VqatXBaYTrjg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([217.61.148.118]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MY68T-1k3npE476D-00YT2P; Thu, 03
 Sep 2020 17:07:22 +0200
Date: Thu, 03 Sep 2020 17:07:15 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <20200819081752.4805-1-linux@fw-web.de>
References: <20200819081752.4805-1-linux@fw-web.de>
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/7] make hdmi work on bananapi-r2
To: linux-mediatek@lists.infradead.org,Frank Wunderlich <linux@fw-web.de>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <3B754053-BA89-4DB7-A089-665C5B6B34CC@public-files.de>
X-Provags-ID: V03:K1:0M3LhMUDc3zMbEzp+O27j0jh7FY2Qc6/35P77yj2d3hoCi5xih6
 tzJAQ21lNqguoddgx6+yoW/vjJk0im+FKxZ6xmmzOU9kE/Dk4L/pYRvLc+mKWVfZs17rtKX
 rBy5IZuHp4d5JQnh8Yeohh9Oxvtu1lJs4ccBVLFEo0itZa2X68yyHZ0PmoWjSGfA/8/o+Ks
 tyFityHCd+83zAE/rEbDw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mb8uLllUtGU=:3T2ujyMqGoE9GQFkq09LBe
 JilBOMJ1Vd5HRz+j5fYeriqFVE4u7GFxYWG2rdx1qdqJPhNtd7eNI0AxFZo5U/3H7ogJfP6O9
 AUio1D4H0/9tfvpouSIqBrt8NrtjLGNXYMQdvy4sRKD0xzqyJFnBbl9K7C/hdykaudZDrb6zB
 Lop8fVf4MLAMMz/CPUhUqtXvQYHja5Pwje+vmV1QmHXkSyWCkqxchcdQjq2mqcaYDYWPGuKhp
 Oq0DBa9nZkCGXmgZf7kruj1zGNIdrWzic+O2m7W5lRcsUVPq6xx8ADXFXL/ViKunY8nSXpNHs
 HLtO+2kRZ2kVZtCbZHOR5yoEnFy79Z4lwn3ROkiwAN16QXE3qm9oholOWXnpQ7S/r2WH2bxxR
 aB1R0fRYTnH+1zZUVqyuRJwQAHrK60C2X5PmMx65M1nMLdK0PwBaTFaOeYiQpU2XnvmGUoKEv
 d72yHlfQ58s3QiGk5Ur9tMpOBr76HBRT2nXnK938zpBfjFcEHQxU9qwjoV7meJZpRQP7q6hXh
 GhKtiYrnYoIpZRLy/JvU3e6SsRvCyDK19ihp+kgs9FjoJSqW2eVrNAVRiLE8D0CHXm++lV+Up
 Tola/9kMnCB2vFuF+s1HanA+paJ8NWkhfnvmQs4vXZa8lb7Isp8KUoSXSWjoBSW0Vc6Po4xUT
 qvu3arLsiiNC0pBbqqyfpChoUGdwNzlRPF7S5PdL+9+06pYCf4/UBm+Y2zCxOMgDVZt2fgKn/
 IMX6xThZj1IcK+LAe681w7qnB/zWGOSRwFuRwFAHETPVFP1j0rwBIiXQPP2Vfylne+biVF48N
 qn5XQtPIc9keAw0M7RFFcICB/47kKpL0U6mwkFn8DRUTdUdC86mrD6gvPHaLj5ObiUM2Iihox
 8f3HaWNDd2D2tbUatw4nnupOu4X7J9NncQDTEDw7VRg4gBHy9uUPjD1Ho9ItUNf21Esbu2E43
 RUWW1jKf9pKrh+8EkRH40YLa3i6e1FO1g4UL4Wv+TwWLrDjSfloq3eeCYW4qAvAuwyqYxgicH
 3WGxMliB5yMHhU2FHZE3drwO+uTQOIcLjZy2ukQ7MGTPKnFPXenzuirRfsAR2u0fFT/Sw4wgA
 wzxcvERyaA/XcR1RKrh6VHI6Y/bCcaqeO2xLd8rXjaKSs0mTcqWWfWt2+kkG2XlAeVSkxFXXC
 f241aGPnQ2amcUCsbjDmT5IYARVLU+rhDtf/mxxgq5OBtXXntYVAA4heSCtaSomYF0DXLwOCE
 AlzlK1/O6X+2aHqfyNTrfXzXBaKB6lvuIKgh8og==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_161317_688950_26D47D55 
X-CRM114-Status: UNSURE (   5.04  )
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
Reply-To: frank-w@public-files.de
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

Any opinion about DTS Patches? Which maintainer will include it in tree? Is any ack/review needed?
regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
