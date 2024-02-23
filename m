Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB69C5478C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Feb 2024 10:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhz6Uk9mvC9Cqa+1Yf4sGTst8YnYtPd1wG+9BtB5Gzk=; b=Qp/G+lOoCVxkvZBdBUWDgc4LJN
	efFoxqGjtlCXMufv0Ht1pBwCMyTWrSelkaebqCb3ZIEV0jA3UThT8xZdFcoOHSzHHNhAVaFZgyxQw
	AQNjqjv2sH01PgtWFpgXUtkq4eo1mtConPBehwx19HaHgDHcdZEcYchgSc1JDLp8syYt9sZFFPuWZ
	F9BuKYdf8GCWguujoDR5opBVR+ipF5Ubxu8/EkpjepnVhQfc7VdZXHFlDiRSbJF6uReDVhf6QGpNE
	fqRGrN1V39Cu8qWPNRqJaGBgKu75QzM972FYx/7736z/xuzXw6AdRIX+lEO4oWoRyYd7WunVQZDsW
	Cmm565rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSYS-00000008r6z-3IRm;
	Fri, 23 Feb 2024 10:13:21 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSXw-00000008r4U-3Rgn
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Feb 2024 10:12:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=hhz6Uk9mvC9Cqa+1Yf4sGTst8YnYtPd1wG+9BtB5Gzk=;
	t=1708683168; x=1709892768; b=ubxcarjSW2rm1GqeQ8lXBUEqG9nvdLpKeFbMCl0o5WVoQAD
	DgnA/bVZXlDsDlB7h3e0/YivP7K6BoxZHsP77AJfQQsXsQp8KmSXb7mO5q5inbTsEV+8Diwhu2Bg4
	K29dnF1RRBrfShKEZx+bdycXHFnrNnSNpH/YxQeM1AbVzDecl1egYUVbHCr3kdolyMHIfmecKWLef
	r1wgC9yRXctSxm4xnF4dB7MTuaK0KDrbsqN4DJCSjA0d4LhMdq0Fxg6xRmCLYaFggu6Vpu6XAABlZ
	7OQUZhKAWg22y1ST6rW2dgpWxzBs1VORuxVqPT6fGLRcapNvYyq6FjAYv96IewCw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rdSXo-000000050oL-4BZK;
	Fri, 23 Feb 2024 11:12:41 +0100
Message-ID: <b46afa718261fa956ad5e730bd9a8a25cf22c12b.camel@sipsolutions.net>
Subject: Re: [PATCH v4 1/3] wifi: mt76: mt7921: fix country count limitation
 for CLC
From: Johannes Berg <johannes@sipsolutions.net>
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>, nbd@nbd.name, 
	lorenzo@kernel.org
Cc: deren.wu@mediatek.com, Sean.Wang@mediatek.com, Soul.Huang@mediatek.com, 
	Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, km.lin@mediatek.com, 
	robin.chiu@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com, 
	Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com, Shayne.Chen@mediatek.com, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Fri, 23 Feb 2024 11:12:39 +0100
In-Reply-To: <20231122030646.31784-2-mingyen.hsieh@mediatek.com>
References: <20231122030646.31784-1-mingyen.hsieh@mediatek.com>
	 <20231122030646.31784-2-mingyen.hsieh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_021251_598784_E1F16627 
X-CRM114-Status: UNSURE (   4.41  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2023-11-22 at 11:06 +0800, Mingyen Hsieh wrote:=20
> +	buf_len =3D le16_to_cpu(clc->len) - sizeof(*clc);

clc->len is defined as __le32, so this rightfullyu introduced a sparse
warning. Please check which is correct (should len be __le16 + padding?
should it be le32_to_cpu() here?) and send a fix.

johannes

