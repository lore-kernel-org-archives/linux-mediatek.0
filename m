Return-Path: <SRS0=mAey=JI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42124C433ED
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Apr 2021 20:08:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D711F6054E
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Apr 2021 20:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D711F6054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vt.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Message-ID:Date:Mime-Version:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=qrlyJLLUsGRO4WdTrG19yU7guq2EC51a16o4YbV6zQM=; b=aKn
	HUfkjEm9nSQxSubgQc32CJ/K2lgv05XfyKqkBMS3wdDBW5qpfImIgjqCcxbBUBR4JapwMmKgXIcvf
	9jx+J+iHYERcwWjqULu+H4uq6LFYIUefdvl5f8us//hSamFT1quWXHXf4dFjx9aHyeS9W49tWMnon
	hELudU0HldnP089hJ8EdPm59KfCZsgJW554GqmIkm42KDp1Rep2Jd7vMz+ol0hM+lZQFTJ4IZ+a8u
	33VDZHQgKEeG9fO36W4b959+ZM04SXesnQ6+5nhUAP9l4WUmiYrF4znEhjF/hmsgs4tacNHXfRYBl
	DVBwS8eDS5H6MB3U8W3FsBomm/Mterg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVgNL-0051xB-Il; Sun, 11 Apr 2021 20:08:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVgN9-0051un-7V
 for linux-mediatek@desiato.infradead.org; Sun, 11 Apr 2021 20:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:Date:
 Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=vVteGm197WS+Pak+/03TURfJdtAKD0/wWNPTtY/GWDI=; b=Yt01/qHcQLtTG7jjPIzN4lWwbd
 XxyGM0mlG802eQ0aatN7lgYENhpwKludvzsUHnAmxNL1gou0Mwyl4TGIWWteltuZ9ZXSGj6x/tFxh
 tauYZGSXYjrGg2/vI3zf4zlinA0X7KZ7A0bWmojGvVWZ1iJhwMovdt7cTzy6w6LBHjYZydxZM0SqK
 Byn52aSHeEFsGx6GBn5VQKGVMxht2Sr1wKIMBRl9DC3u31Lcvg/xiW/3BcECfshwXasWFOMKQoPIS
 R860w7XhNOlQETl/BeZK4L6l+nMIIz9sSjNXEaij5XHIneyhow4yFTKZ7KPQbjHt2FpwJXp8IQK9Y
 VonrF74Q==;
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVgN5-005gQx-DK
 for linux-mediatek@lists.infradead.org; Sun, 11 Apr 2021 20:07:53 +0000
Received: by mail-qk1-x734.google.com with SMTP id q189so906484qka.8
 for <linux-mediatek@lists.infradead.org>; Sun, 11 Apr 2021 13:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vt-edu.20150623.gappssmtp.com; s=20150623;
 h=sender:from:to:cc:subject:mime-version:content-transfer-encoding
 :date:message-id;
 bh=vVteGm197WS+Pak+/03TURfJdtAKD0/wWNPTtY/GWDI=;
 b=wDsEMJNSELb4D9d8wRNn0MbMRRWFXjdzSA7q/kyUPTt3sHrv50eaai5yZPPumSweIa
 8k4TpNFR7hd5n/U/hYnGJKKf5i2WNXrMADJ6Rj8Y1hYcxAoJzZy1toNQIiK/LsK2uqjN
 P0Ap0VXL/4IBAmXsSfE3DH6XcmAGg9K2vwkQTEY5jTdV46N/1V4N8e+ZcBjkhba2cRJ3
 3XTmKMtGmdIzxN0AOoYZTMJi8K4UYLQHfQLAT0TGPTL74HtmFg6iXerq83xQUFzwxAu7
 DS1vav5shfWwDpe4P8O2p0b4mPaUtEAo9ByGkiX1MApQr4YCviRVtvO1Q0wUuEmmGavR
 b9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:mime-version
 :content-transfer-encoding:date:message-id;
 bh=vVteGm197WS+Pak+/03TURfJdtAKD0/wWNPTtY/GWDI=;
 b=j7KUnOV6m6YKRCc3FjV2uRm3VSqYxxTtM4uidiP1SfYqi1gS9NR2K2lBgbBjJ36Vyf
 YGslnpTvfUNnGsGxSl52VikCIVR/5X91p5XtTzsbjCcnKUdMtXPD9gAWCLf90z3kNejC
 Cbx0RYSRRDh9KyzxB8eiPfe2Y64P0IOCUPW6/69ydQJldR7iA9A1NUTu7taWrNrCYPtD
 SLrd2b1cwjhl1SD1J0F31CfCLsXgUAcWVeKSrB6k/Ec7pxfUL0qGHudVzZ+TYsRt7xvX
 77+5hQXEJhGKhrXi9TnRcxAFh7bOPfnHSwTgch+qxE27vV0/vOAqyQG19ZLrSlFstevr
 AT4Q==
X-Gm-Message-State: AOAM5315ZzLxSjUvNsys5gdrVQntazHljgV/5tM7zvPvg7K/WPS74APn
 R4YzQ8bgL/C+A35/3uLu7Btomg==
X-Google-Smtp-Source: ABdhPJyAChITVeE/MPh85xPT3C4GtprBydVBUFkQXQgUgMw/idzip7Ea7PWDwcBBiq0rEPbkfjkx2Q==
X-Received: by 2002:a05:620a:110a:: with SMTP id
 o10mr1706986qkk.148.1618171664926; 
 Sun, 11 Apr 2021 13:07:44 -0700 (PDT)
Received: from turing-police ([2601:5c0:c380:d61::359])
 by smtp.gmail.com with ESMTPSA id h9sm6275557qtk.6.2021.04.11.13.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 13:07:44 -0700 (PDT)
From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?="
 <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <jroedel@suse.de>,
 Will Deacon <will@kernel.org>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: next-20210409 build breakage in drivers/iommu/mtk_iommu_v1.c
Mime-Version: 1.0
Date: Sun, 11 Apr 2021 16:07:43 -0400
Message-ID: <14335.1618171663@turing-police>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_130751_521564_53F4976D 
X-CRM114-Status: UNSURE (   6.55  )
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
Content-Type: multipart/mixed; boundary="===============3838453418209287768=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============3838453418209287768==
Content-Type: multipart/signed; boundary="==_Exmh_1618171662_13593P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit

--==_Exmh_1618171662_13593P
Content-Type: text/plain; charset=us-ascii

This commit:

commit 8de000cf0265eaa4f63aff9f2c7a3876d2dda9b6
Author: Yong Wu <yong.wu@mediatek.com>
Date:   Fri Mar 26 11:23:36 2021 +0800

    iommu/mediatek-v1: Allow building as module

changes drivers/iommu/Kcconfig

 config MTK_IOMMU_V1
-       bool "MTK IOMMU Version 1 (M4U gen1) Support"
+       tristate "MediaTek IOMMU Version 1 (M4U gen1) Support"

Unfortunately, this doesn't actually build properly as a module, because:

  MODPOST modules-only.symvers
ERROR: modpost: "of_phandle_iterator_args" [drivers/iommu/mtk_iommu_v1.ko] undefined!
make[2]: *** [/usr/src/linux-next/scripts/Makefile.modpost:150: modules-only.symvers] Error 1

There's no EXPORT_SYMBOL and drivers/of/base.o is a built-in, so
the symbol isn't available to modules.

--==_Exmh_1618171662_13593P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBYHNXDgdmEQWDXROgAQI3Kg//UWC6smWytHYy158jtuNo7OaHGa9t9z7H
lAii0QD95wLc+gUO/BnzXGuNubA9NdVlesFcQv2U9oIdKcAZ3fZCJPf/u8Rr97Zc
a5+au4AJza/4tYVU8z0+W/xqGU6vqv/vA7dJgyN8BbOZLD+rjHUj97ZPm23vcnd+
5NQI42xXvbCREQi9xy1JwGd+7TAZsht27XaUbU+2es69bmDfW0g3O+sDqqn6mt4+
sExSalCV+F75JENIYpPV/xd2FU7naYSngtOASLFr5jzcQmaRf0HJsplnpzdm2da+
FskOg2KzHVybqM458G6hZhoTS+Z7DGVAY/COLV35ino9JWVnfO0u9Gid0uFeQes+
VVtXumGlnTuKgIQbIIBJ3pfX6DT3tTUbgSe3Z/0eI4L4xi6yQCCS4zlwBCnl10ry
gH1sCvYC9FQivqIoEBmM3MCXG06AwEbRkEHtdhLOrFCzRq7RWaHug0yvT9QGKHWe
e34rB6PHzKKSPGMinaOyqHcLS5L0va1W5v8LSltW2xtElcqahI7eCNZXI72i2aZH
TB6APLeQqlCStsDLWGVGWBFO2c8mYH/Ww42UyI7YSTVpQOf4O7oLrkG/5d2WZqGB
8qYnaoomGsCl6Npi9wzDZ9FWK6PTa2KaovEp9EiwzA9NHVZ2OyHg5IXZBwMiz8BY
GvvNXIphQXU=
=yc6U
-----END PGP SIGNATURE-----

--==_Exmh_1618171662_13593P--


--===============3838453418209287768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3838453418209287768==--

