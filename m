Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D74C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 01:02:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00AC661042
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 01:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00AC661042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vt.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Message-ID:Date:Mime-Version:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Qtx+Cy1mgs/ZOQ6wnmY8dvVdiPPwxlDz+0YcAbhZW34=; b=lwz
	eIFv66+BNXuWptV+jnh4wHOnsEY44mOFURO6f68cE6DEIcEmRA48eRkE7IYCP+LaMqU7f4CSWcAJc
	z5ta9uy4rq4SXg0+DAn/jsPN4+7P2jB0oLTQSmpsjGb99EnZdBO3Cqzh3xR4NWrTNxCrTCY8yOrZP
	0vroPsOs2F3gSaPMb2U+0hk5mJoaDUBfDmNcuf0HXXVtj5WUQ7cOD3z2Vd3k/3qGWATk+71AdgGwW
	BHGgKTAWowbM0w2DwF/PwVdnlDyj4etQRLildSbbkPmA7XVbhB3y0O3My2qlP90SlQ3McK8hp/g8g
	8e8n0ERV20rAxuhLgDjbGEWOqSAI4Og==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYIJ8-008qfa-6O; Mon, 19 Apr 2021 01:02:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYIIw-008qf3-Q0
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 01:02:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:Date:
 Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=RXam8/yrKFBoz2nKLPMW+gAL4t/Dm8FLDbdkvQGBxIs=; b=NUSeP6B0LA2ecZ9QNkgkKf1a7W
 Qpmzqp3Yg7oq+NKiBlI5tM0mxqlut/CpLDPe+qo0dbCinXLwpOO6GbFCdEzhKx7cx8C49lt8YN2mP
 Mfvby6th1+kkNYCxg1bYG6sc9uEJR2Km40j2aS61EhJj8uGThcV9pLC7luZRu6J1MSRworgVTEK2j
 pyb4Ao38U5QZWZw08KnwvXMbsCR8a/NhyXy02hcoi7oL7HexT296uuyb41ZRMCTwSCeez62X6YGrA
 DweXe52d6+M0hLC2LWcjthdnO/M5xz5Vf26SjaKyQ+0pbKM9YIFKZyz5k5zPXWByEOOXNQmMSTXuE
 44IFTcjg==;
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYIIq-00ApvH-CZ
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 01:02:20 +0000
Received: by mail-qk1-x732.google.com with SMTP id h13so15710024qka.2
 for <linux-mediatek@lists.infradead.org>; Sun, 18 Apr 2021 18:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vt-edu.20150623.gappssmtp.com; s=20150623;
 h=sender:from:to:cc:subject:mime-version:content-transfer-encoding
 :date:message-id;
 bh=RXam8/yrKFBoz2nKLPMW+gAL4t/Dm8FLDbdkvQGBxIs=;
 b=H6S169QP79gGhsQKKA2kKXR+4q+a+T0r3ZkwWZ/s+14xnmPs5QDOFVz4mD+J+qqpyf
 /Bgugt+pTV0U1sQghwysF/aGYIzHJf/47HLCo/H5j52pbR+qPQP32lEkc6lblm/PRfkY
 TrlNUyyzRwv3tjOW6CVfsBqRUWD4PpYySlLnpAASTqhBjiVGWDvw0yuPTRJwnjK86J9w
 Sxp4D0M8JJQi901u3BMMhyux/Fb+z7ShsIstoFg908XPswgo45+y3tRalrqGznLSaEAd
 gCwOK7GPWZgsMbpu6KLZojWlysgEpkO+xe/lhkLauO4ZlQ8w6akiF1DBAHPakaaI25RC
 k/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:mime-version
 :content-transfer-encoding:date:message-id;
 bh=RXam8/yrKFBoz2nKLPMW+gAL4t/Dm8FLDbdkvQGBxIs=;
 b=lR3fI0DTqFL0WjoHOBoodVr4mRMa5qoSkgNk7shhH+hLyXpi0AOylvi3oY+rf07iRZ
 0BHw++Omvl++0uVCsLTVwoJE9WOT3JYDaCJYX2obe/oZyupZ8cLH0TQebFKF8u8D+e44
 DLWdbJtBHoCm/dim05p9C5IapBmRdEA1KB7E5QxT+GJ2JhJuxIV4gyUJ4bYQcJBPy/bE
 dt6D+iCZBMJ7wx8YG9s6R5R1yUTcqT3wUpVb18D+bLi69XrvMrYfj8590XVG8Lbq741U
 a1/LvqFmrwGyxaBj22n/f4FaA19bI0A+j7fyhfagAB5iKQXFM/5QFKQIs7LtHKhahL2m
 hW6g==
X-Gm-Message-State: AOAM533qkVfmAn0rHxlJgF9sN9iCHxTzPQjfs0Jm/DEgMQD4VwO+FdKj
 jVbfXfIVkS8XsDmrhSebJzfE/Q==
X-Google-Smtp-Source: ABdhPJy0Kau8aXbq90XTNnBOjhUdqhQzEs89RasWQd28uDmQRXyvdq30ubbRcFkERw/LLHo9M3Q+pg==
X-Received: by 2002:a37:e30c:: with SMTP id y12mr9437334qki.244.1618794134634; 
 Sun, 18 Apr 2021 18:02:14 -0700 (PDT)
Received: from turing-police ([2601:5c0:c380:d61::359])
 by smtp.gmail.com with ESMTPSA id f8sm676599qkh.83.2021.04.18.18.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 18:02:14 -0700 (PDT)
From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?="
 <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To: Felix Fietkau <nbd@nbd.name>, Pablo Neira Ayuso <pablo@netfilter.org>,
 "David S. Miller" <davem@davemloft.net>
Cc: Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/mediatek/mtk_ppe_offload.c - suspicious code?
Mime-Version: 1.0
Date: Sun, 18 Apr 2021 21:02:12 -0400
Message-ID: <526789.1618794132@turing-police>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_180216_609286_0D2A8DF1 
X-CRM114-Status: UNSURE (   7.55  )
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
Content-Type: multipart/mixed; boundary="===============5929043878734816603=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============5929043878734816603==
Content-Type: multipart/signed; boundary="==_Exmh_1618794132_13593P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit

--==_Exmh_1618794132_13593P
Content-Type: text/plain; charset=us-ascii

While doing some code auditing for -Woverride_init, I spotted some questionable code

commit 502e84e2382d92654a2ecbc52cdbdb5a11cdcec7
Author: Felix Fietkau <nbd@nbd.name>
Date:   Wed Mar 24 02:30:54 2021 +0100

    net: ethernet: mtk_eth_soc: add flow offloading support

In drivers/net/ethernet/mediatek/mtk_ppe_offload.c:

+static const struct rhashtable_params mtk_flow_ht_params = {
+       .head_offset = offsetof(struct mtk_flow_entry, node),
+       .head_offset = offsetof(struct mtk_flow_entry, cookie),
+       .key_len = sizeof(unsigned long),
+       .automatic_shrinking = true,
+};

What's intended for head_offset here?

Christoph:  This was the only actual questionable code caught by override-init
across allmodconfig builds of arm, arm64, and x86_64. The other 218 warnings
not already silenced by Makefile twiddling of CFLAGS are all legitimate. I
admit not being sure what that means for its use in W=1 builds in general.


--==_Exmh_1618794132_13593P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBYHzWlAdmEQWDXROgAQKBMRAArsoGj4sOoT0DAvTbdQb1ePhTUDMRptuS
rjlchzSFgPmnVRcZA7uHfMclr06Sv4Z7x3YUi1B9EoVpCJ7636ZVvYH4C1moc6bc
u6bwTdsS1BfpbDy7UJB3J+81f6TvsajnNMaTVvJKyX83zoCw64gkozaoaKRTlLfo
bC2WoqTVqSyfSKWx4k3dC22A6U5FnFhmxulr3FAhbd6gg50LqWn4zA8lpILIpAMW
XIRZMHPDqCQ4HLck6lRj4Toj1KUYKA6c9nWr31zHCd+yBwDGB479jNc578gSHYL9
OJ4z7Kb/S/fIMilkNrjo36qqmiW5XS/vW55GDSpq0yhLzlSdwrQbhd33x/+y9w11
GgLRSSSL5W7JDpGaUcOJkV9j5vAVG6AB+3j60RdzR9rDF59L/jnCp++lilrcsW3a
A9iyYczjbT3s0DwZmwC1NTk3L/Sq0T27wAKgojgacJ1eNGVRZy/njR2tFfwTqord
j/5MDKBdB7oNzuvmVuJG4+m//ModL/oPC9vx8nZJgZiS4JpfIwHXDlZdPwZlR8lC
SAl5LHU+5GD4EN4ZjoCn2Ocl0veShZoKYr9TQXXWPg3W5uKCoFioWqO+wIeL0mop
5nu6OAf1KvGq3KmP/dqBA9GElv3GaUkf75kRoK8gED6rLjP+kqcThndQzGFQOo7E
GK82Pd1kWTM=
=YBHY
-----END PGP SIGNATURE-----

--==_Exmh_1618794132_13593P--


--===============5929043878734816603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5929043878734816603==--

