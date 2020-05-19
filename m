Return-Path: <SRS0=0J5R=7B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7444C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 11:18:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9712D20708
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 11:18:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rF/AEaZ+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9712D20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vt.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Message-ID:Date:Mime-Version:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FthnmStf5huaJ9LMcDUTsIzDlagvo4V68r2QAHt+FLQ=; b=rF/AEaZ+is6Y57T0YEfkkMq2Q
	02i/IVCik8844b09V87gLRhKgUdVrqomW4un+vL8YZa2MPIdlyXv9xbGC4WVFB38IcoxjJ5Z7zGV+
	w4KgkR3zU323FZt+SyuiVizt5uOSVFH8TU5tj4hIKX46k3zcxGbFkgtvLmJ5ZiYEVi8Ww/vtfExdf
	ieJl+y/fnVWwyteTPNQ+E3mmog0jt3ENdaHt5HwG0Y0lW8KNK+wpo8LhGbAnZeq2KKve7LpDj14IX
	KC1Kh529dEa5fqHXEjykxGa00x1iXywAdkfBxy3byskMuwtqaKfGh4HfJBaSnbUiSTz+5JXSDeIOc
	wB/mtxsrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb0GD-0001aQ-Ug; Tue, 19 May 2020 11:18:13 +0000
Received: from omr2.cc.ipv6.vt.edu ([2607:b400:92:8400:0:33:fb76:806e]
 helo=omr2.cc.vt.edu)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb0G2-0001Pm-98
 for linux-mediatek@lists.infradead.org; Tue, 19 May 2020 11:18:03 +0000
Received: from mr4.cc.vt.edu (mr4.cc.vt.edu
 [IPv6:2607:b400:92:8300:0:7b:e2b1:6a29])
 by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id 04JBHncp014171
 for <linux-mediatek@lists.infradead.org>; Tue, 19 May 2020 07:17:55 -0400
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mr4.cc.vt.edu (8.14.7/8.14.7) with ESMTP id 04JBHioW031057
 for <linux-mediatek@lists.infradead.org>; Tue, 19 May 2020 07:17:49 -0400
Received: by mail-qk1-f200.google.com with SMTP id j83so12212695qke.10
 for <linux-mediatek@lists.infradead.org>; Tue, 19 May 2020 04:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :mime-version:content-transfer-encoding:date:message-id;
 bh=XdezUHtnjEPl34SNV/OG/wiZxI5dHtj/gxxjDGommaM=;
 b=D1h2UsX/kVlG4xqWIibV+9CwKiVWCOUc3KzfuiY8lqznwJEcIWK0GAqGl4x4DsH5eX
 rjKxGT9CXlbv9Q7NXlyxizi2SN6yHdczdqoK5sad6W/4JTltnywrNxL0oT5TqT4BW3Ua
 7QSe7770D+/CjYlzJQgkYjD0HIWL19yMB6QvNaeIVii+9l9BdhyOAl4MMUFKeRb03aaA
 jZI0ijk6hwV21F+5iGaliBPCifXf1urYdhFgp5oDoUrB8Tpw2CgJ0VMPeM1JFGgarLsv
 cK5bEGQHkPWHyvq9CMEoTvnar0IzoaYT5TrJbxluDCvBOS70fpRaC2lTYOayL7IVd8HW
 rjHw==
X-Gm-Message-State: AOAM530i8gywG05LxXiPjCtByBgmcyeiWQY2+Jc+MmfqG6SPiQyuEWRX
 +0N41kHKDBPKWVnI/L8BV270SU+Ly8/aY1rh50cySgkq92yq8THi0gIsgplaj4Td4qdOZ21g5P3
 UM/x3NajOifbK2vEneNAauGVREANZKxwEE9xTCdmwsa8=
X-Received: by 2002:a0c:aec5:: with SMTP id n5mr20903691qvd.0.1589887064022;
 Tue, 19 May 2020 04:17:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYm/oMeyoCURXB8A/ux+JFjkbZhUA+4db9QUZHAWEUR8WA0qRoukom4Qn9ITWbQR/8QthsHQ==
X-Received: by 2002:a0c:aec5:: with SMTP id n5mr20903663qvd.0.1589887063744;
 Tue, 19 May 2020 04:17:43 -0700 (PDT)
Received: from turing-police ([2601:5c0:c001:c9e1::359])
 by smtp.gmail.com with ESMTPSA id z65sm10191073qkc.91.2020.05.19.04.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 04:17:42 -0700 (PDT)
From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks"
 <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To: Qii Wang <qii.wang@mediatek.com>
Subject: Re: [PATCH v2 2/2] i2c: mediatek: Add i2c ac-timing adjust support
In-Reply-To: <1589857073.25512.34.camel@mhfsdcap03>
References: <1589461844-15614-1-git-send-email-qii.wang@mediatek.com>
 <1589461844-15614-3-git-send-email-qii.wang@mediatek.com>
 <CAMuHMdXjLakWDDEy=02prC7XjAs_xBnt2mArPFNwyHgUoWw6-g@mail.gmail.com>
 <1589857073.25512.34.camel@mhfsdcap03>
Mime-Version: 1.0
Date: Tue, 19 May 2020 07:17:41 -0400
Message-ID: <116825.1589887061@turing-police>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_041802_452174_F08D72CA 
X-CRM114-Status: UNSURE (   7.17  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, srv_heupstream@mediatek.com,
 Wolfram Sang <wsa@the-dreams.de>, leilk.liu@mediatek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, Joe Perches <joe@perches.com>,
 linux-mediatek@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============6533667986293896738=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============6533667986293896738==
Content-Type: multipart/signed; boundary="==_Exmh_1589887060_31675P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit

--==_Exmh_1589887060_31675P
Content-Type: text/plain; charset=us-ascii

On Tue, 19 May 2020 10:57:53 +0800, Qii Wang said:

> (1000000000 * (sample_cnt + 1)) / clk_src value is a 32-bit, (1000000000
> * (sample_cnt + 1)) will over 32-bit if sample_cnt is 7.
>
> I think 1000000000 and clk_src is too big, maybe I can reduce then with
> be divided all by 1000.

Yes, it's definitely too big, the 3 DIV_ROUND_UP calls in  mtk_i2c_check_ac_timing()
end up causing a build issue during modpost on a 32-bit RPi4:

ERROR: modpost: "__aeabi_uldivmod" [drivers/i2c/busses/i2c-mt65xx.ko] undefined!
ERROR: modpost: "__aeabi_ldivmod" [drivers/i2c/busses/i2c-mt65xx.ko] undefined!


--==_Exmh_1589887060_31675P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBXsPAVAdmEQWDXROgAQLPGg/9GGQpzw7XKYxr/tvBAg5sc8H1rTqhNMQF
FGBWDl46QaKwfWatNNq0L6HGC2X9FDlG7hdzIi0HJFJjTDVGlN9C/QNH5zeCmMCF
zDcbsj8tnLoNMW4v2Dl3Q2ZxFWihnepXqfzg8KG5fDDiEHSaP38hDe8GK/MXb5X/
KjGRXMF1qQnbDh2q1trjaJExQqbJ2D2wyngaUS0vDqJOaXm3TaY91NbNUQUVlOmd
wQl05fDL7ziCbcrxn5HdNSxaBiSTNtQwcBrsV8JF7YImeyDx+/I974qRSxZB8zKF
+RPabakMPOZFBgHrikYKplTogjXN5fCCF8F/muITK1/EPpI9PgeMDZNCGU07xRux
v8/UkqwLqAuAnqG3vm5F9I1q+0qbEyyCaU4Mm2DWMGyYzCHXAkfQAJQF/MkQhE54
JxyZKSv7Y4x+nMgL4tlD37DFGCVTXlk9nUyKcNqr08nlu2nDiszlTScHtuHnSqEo
uk3mbh7mKYwpbMJIa/j0n5zLVabSB09IDZ5Jk/+ZlTPh143zTqqFXKfB5akC6Ve5
6pGPcsXJl6ubOdaLT8LcxRVkyaKa/3tYXLBFjxsu6NkfNhytddnVzPAw6/5qRcos
M4R7h0mvQLLRPDLrTkNq1ur6V/3xgup/M8qAunQyKWPNZXYPvNc93Vgh1b6274o0
aL8PqtTCnss=
=SvGK
-----END PGP SIGNATURE-----

--==_Exmh_1589887060_31675P--


--===============6533667986293896738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6533667986293896738==--

