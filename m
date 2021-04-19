Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F91FC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 15:47:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C54B061246
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 15:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C54B061246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DGvQWLCsikYGYg/FlyWXHjWRnxRTL4IX6P9/0qA0eQc=; b=GWvxjN7pZaKKWFtYEdSXKGMGxk
	Zyd8rTUt3bLDp17Mnrcon36ryCl4RZ2VMPs15ulsFB35tETyPPeuyJFDDWdqb+VhiR1Nj8UrzLSXC
	QOGpzYoxxFxBtyFtO4vPAFLEeY97Dx2k1911/X81gIEJTTcavw0/KmAMvcz5lpUdpEkbS9I9kXMkQ
	UHFtcqMdaVUwIzOJcgd9Mli0NRUKOuRtorSxpzHOQFHhULaVLXItp/4CsCjWE1znEpRpAMRaH3izG
	lWH4CIOcGez99EdFRADhmXvhyCWyrwEkXHRJJD3zeR63Rd5VRMjdMd6VMg6S4fllnWrR+j8TJoThb
	ClFM0isQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYW7X-00ADG4-7d; Mon, 19 Apr 2021 15:47:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYW7E-00ADE7-BV; Mon, 19 Apr 2021 15:47:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=mHhGKeIctTE9q3TzmUGJDnwdfTOiVckaG8iU9u6BBb8=; b=l9LAjoueHHQPr3RRoqdLegPHve
 NFXnXKnZ9Aiv83el3xs8CUYp7cNBXQskmeG8Ld73pq6F5rdkdRX2/fp3M/oQCuodmrDe4nQ6i1Uaq
 7fF5zo7h82LomF1aszGt9MfB8kg1NiJr19CytjhXPwcsMbw62SZmgo2IfSqfnF1Cn1d6WO8IzytZ8
 OAGkceGclPNw5q2l25NGIhkUIcsuXH5sBDqWRvpStquudgKhfdqbpjMC7NfVxLVzTE1wd4l96riD6
 vN6Si/18zBM8mcx5PbJ1+FVCAoYmrJ3czh0uGnRKyVWQNE9W0xHimCmiFW40eFE3YnRxXniwUPFDp
 YdrDh3MA==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYW78-00BUwO-RE; Mon, 19 Apr 2021 15:47:11 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 em21-20020a17090b0155b029014e204a81e6so9389702pjb.1; 
 Mon, 19 Apr 2021 08:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mHhGKeIctTE9q3TzmUGJDnwdfTOiVckaG8iU9u6BBb8=;
 b=U90mGE3SCk0hHq6gZdSn7f5crLx4hqsKgL310yjp+KUu94mfLaOvGCsoYmwDB2bYkN
 fqDRYA/ECwXF/mNHS+TCCzpXxr1lDJNuTilbZEVVj7YCeBjEiDpLJOh3oDr9/zbDqYCo
 iKGHUzdSjujJIzH/sLJ8K3k+Xyf9u5DlmjpCwlJIVBrnfQHAJjya377j9ZORGjHw0Zqs
 4OlM3UPZv3egKZwUcFmqWM1RMMpekeIGeIm6NUkpNY5UDzCKofuXpqjlyxau1tAJ3AyE
 thosZnwjlaHHMTkGGlAK370SddaR0E/10GdgT5Dea5fpb5QKRGRdRQh8/5Gu97JrCCUL
 3vbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mHhGKeIctTE9q3TzmUGJDnwdfTOiVckaG8iU9u6BBb8=;
 b=uF5MRz4SbVZe0mpx6yJKfvKXbJf2lwvX0JjmCc5ntNG++0jSuGioSY/sQmSGrAiI2c
 NiG4Np0zrPrJV7i8CSocvOgvpcfL+G56uEXvh4B01CUzj5s6XjyS0i8TwYf/aUP8cCA5
 6ijYTinnIzKrNBGZGPcypdn7TvsvsF78WJ8RyWjfL0gnaEseqN6gejCMQPKzY4z7erZ0
 sktuDt/VbuzzdFLxAK2wki763JnhrxtxE5eL4Di8vL/7J+slT3q+snrzYUdzT/tlz3n/
 gvamfYhvnR86yEZxd37E70LCdOlK/nP+Ko8fLeW1Kqv2maITa+5oytoDSfTOE1/X6924
 W/TA==
X-Gm-Message-State: AOAM530GJw36dxfOW4Fo4hKBNNeQVsZCDopfVDZSg6kRMahhGZW3bgWt
 D/6amGM46WJ6nLdHVf+qJ68=
X-Google-Smtp-Source: ABdhPJwEv5qT/XqTbj1q/dpSsZUb3bCHW7/pzynCrX00Sh6PkmdMESDZ61kpeg+wuvILIqa6MO0Ukg==
X-Received: by 2002:a17:902:da85:b029:eb:8794:7078 with SMTP id
 j5-20020a170902da85b02900eb87947078mr21536236plx.25.1618847226006; 
 Mon, 19 Apr 2021 08:47:06 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id u1sm15314139pjj.19.2021.04.19.08.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 08:47:05 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next v2 0/2] net: ethernet: mediatek: support custom GMAC
 label
Date: Mon, 19 Apr 2021 08:46:57 -0700
Message-Id: <20210419154659.44096-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_084706_906631_3402737B 
X-CRM114-Status: UNSURE (   8.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for specifying GMAC label via DTS. Useful when it is desired
to use a master DSA interface name that is different from the "eth%d"
pattern.

v2:
  - Use alloc_netdev instead of alloc_etherdev followed by rename

Ilya Lipnitskiy (2):
  dt-bindings: net: mediatek: add optional GMAC labels
  net: ethernet: mediatek: support custom GMAC label

 Documentation/devicetree/bindings/net/mediatek-net.txt | 6 ++++++
 drivers/net/ethernet/mediatek/mtk_eth_soc.c            | 6 ++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
