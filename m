Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EE2C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 21:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FQl/76Qbqte4fVJmlL7WAYT8S3tkJD7vqlBp3Ta3BXU=; b=UZgulQPW2r0Ae4VmbectW1GNFK
	bPhmolGX+dBCDctBW3PVSabnpmU1lDDimeOTxlSdd2WdYiDCQexLFrLuit499HWZ7yPKi+E0IddDO
	OO8zJc3/KSLUsry3imFH0LQXSRNeYvW7a5bF5EbzQpopZx9u2iF8GK5MdN05vkWTqO3vS6Chg6T1B
	30e66bhcqpKdhHqtxgYvzivBTWbjH3RSuKKF1ujH9PFcG0HaChepzbDwZYLaKboYj7rV65XrcO+G3
	hh9TMZata7SRle3A+62kN92Gc6PIS/H//YQHCUayRut8RR8v1zlaM0Z0dgmvaZRSEF1kJNCSnqTVB
	sdYcr7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8pj9-00CQRu-Ru; Fri, 23 Dec 2022 21:37:15 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8pio-00CQ85-Dt
	for linux-mediatek@lists.infradead.org; Fri, 23 Dec 2022 21:36:56 +0000
Received: by mail-qk1-x731.google.com with SMTP id a25so2881140qkl.12
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Dec 2022 13:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FQl/76Qbqte4fVJmlL7WAYT8S3tkJD7vqlBp3Ta3BXU=;
        b=YhoeCmS8E59bILv70dkyyIduqvYX83mAGInMibHDhgo0tk6DykF+jsGPZB5bxHUqjy
         8YrWXirta9o7i/o1wNfcsOQxxvljnvWweae/N+5qQf1VmmbfxAcSsI+wzxECrI8Z4Git
         PzsEHhr1HzS1yZvNYuuPphTBjSZsl2IS5bFrmR/PKJIj12BMdu+MLV4IvSA124iogMa2
         t1FmRUHZa3r2SnEm/FpwYEqW9Ox9CwCDTa9in87XR96UK0MWsZXbpkBQgHGn6kkHW/er
         ajiVz4/717vbWBd4vgGR2Z6qXguEL3J6IjkWUkP9tRkb7IHLRrSGXdZQ4076DmxPU8Rk
         laTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FQl/76Qbqte4fVJmlL7WAYT8S3tkJD7vqlBp3Ta3BXU=;
        b=4SzrT9nd3RDNNLPxt5+sPILjcCVeE/iiczbBkcLoegF+UoSjwRd5TmtfzHo6J316E6
         bhTaAV+jFc6DssjGIGuAcPWEsl+d7Jk5s3xGdQ/SLiEHRBA4zKtNri5Xnpczm0JJcBmE
         nTY2s2Pt3UQxaLUJi1YcpJvP55Iv/VTm+5QHs/2bBkhko9k4ynXzqa/QxXg2uiA6SGq3
         bSZmYi/wr25JT9DPayKhmJ7uByogYMp1lchDOFk2rXMRPycG1U4nFLaOjuGVKx65lbwy
         7H95NcShsoTNaZIG6+rvCb2m5RvM1BpfWv/96sxY0G02Ri/C/UD1PnsT1GZguui1Hrjv
         d3AQ==
X-Gm-Message-State: AFqh2koHNxODmUbNeHy+kCRcFSau4PgzJkfZJb0kBBbEx/yQC9/WBpx6
	PMBgDTziHkR57hD/PPS1gyLNfh44RV1q8zL4YA==
X-Google-Smtp-Source: AMrXdXuSvTz92FM6LoV9OmCmeotEKkb6BPDV+TCWa5PCfnK1/aAkhdBFom5bvfkmTAe991Pq8JTL+axZtgcVM5SaF0s=
X-Received: by 2002:ae9:eb4d:0:b0:6fe:ffbf:1b51 with SMTP id
 b74-20020ae9eb4d000000b006feffbf1b51mr585289qkg.361.1671831410196; Fri, 23
 Dec 2022 13:36:50 -0800 (PST)
MIME-Version: 1.0
From: Nick Morrow <morrownr@gmail.com>
Date: Fri, 23 Dec 2022 15:36:24 -0600
Message-ID: <CAFktD2fRnSbNgWRRoGbQzG5_Mw7=zFJKTVBHS_3D+mNUYcv9hQ@mail.gmail.com>
Subject: [bug report} wifi: mt76: mt7612u/mt7610u - 6.1.x hard locking systems
To: nbd@nbd.name, Lorenzo Bianconi <lorenzo@kernel.org>, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, Sean Wang <sean.wang@mediatek.com>, deren.wu@mediatek.com
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_133654_567269_1B6C6FF8 
X-CRM114-Status: UNSURE (   6.82  )
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

Starting with kernel 6.1 rc1, mt7612u and mt7610u are hard locking
systems when connection is established. From a report this morning:

"So I'm using a MT7610U based adapter and updated to 6.1.1 in Arch
Linux and it's a complete lockup a few seconds after connecting as
other people have said, I'll use the LTS kernel (5.15) in the
meanwhile but this is probably going to get a lot of people that use
distros with newer kernels."

Background: Problem first discovered with kernel 6.1 rc1. Bug report
was seen on linux-wireless around the rc5 timeframe. This is an
additional bug report.

I don't think additional info is needed as I have tested on several
distros with various RC's of 6.1 and the problem is 100% reproducible
and unavoidable. This is a show stopper bug and will result in
widespread reports as distros upgrade to kernel 6.1.

Regards,

Nick
https://github.com/morrownr/USB-WiFi

