Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F5DC61DD6
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 20:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOglgLUq3iAA=; b=iX2Gd/VxNhml1NA5oVVD9rE09J
	o0RtZUON43ixFCtbWHm0F5yMNfC3qIeLaCzXXaL0XDcgIqQh8CCTFmiZ50msl9Fiu6cy6YudsqQDz
	mton4QzE2ImlCz8JY0rC9B4sUwCEtnuHGqna314CcDMrzYGpjlqTiYAUkLs3dBWxZjRbQX40FgjDL
	xFmu2sCkf3u0XXZdUndFaOoxbcfd9+ZNO2L3VaodFvKs8IYHlecce+W6u3DeOmf1CqlIRaQ1+LFRM
	3CzodQe1G/lUB1oCO1bFrbLbJcOmLqMb9zxVogn40D0700n+ZmDQ8/T+/igiF9d0zyoK3c5NCuK/1
	5bfdXwNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rF2-0000000FotP-1Ond;
	Wed, 02 Sep 2026 20:07:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rEz-0000000FosD-3SGN
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 20:07:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HruJU2731237
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 20:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOgl
	gLUq3iAA=; b=o8qTZHJ9wPF3L6nko83fbw4RSA3+laqGNZFT6uDbpl+YVhbI4Bh
	AiRHxzRb6pGr6xp1CtxCYePGu78jL9tipjO+GqINkNKz9aKmqQETyzIoUWGhomIb
	iHj2NQn7DXHMQGBwbiTG3w8x6S+gXIGWDSIGmvst6TY1qfC9HSx2tamypr9XuoZ4
	uxtI+2HSG/JmVkElTyVouC3zK8UcSsL79XGYNVGgsHptK9GY2nADRzhKHoajUrxa
	+OkIh/NIGe1kQa57LP0JOI/jkm6d3OdjCGYpl6KGAT0xozaNsl2RXZKAkvZlr6Op
	jeOzEpXx21MYBqscJHxbUbwqhNyliYP0sag==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy2s3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 20:07:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so3010778a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 13:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379643; x=1788984443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOglgLUq3iAA=;
        b=H/mSyi/SMVL8/b2n40JNhBy6Y0OlQutQh4Z2wBE24+eog5z15dvUWOIfFLOy/rxsmL
         2TcTQPXNem+1ajFCks5M3IgZvXcF0WQo5B+E+2gpCooX3K7294vg3SKNZr0hKAWevXpI
         Fw2M6oBwXN23Fk7Irhwv1Eo1oLKqEQyaUr9wHXpkvbrfjS0qdVx8EpuZpOgMXj5vXtGH
         QzHcTny32HT3df07AP+RYT6bTGnN4lQzCEpSn+C6ExAP3yfl+Gd7mascnuTQlRyE8kf+
         b2uDTVqnJe6bGNUPjXpwwb8r2jXcKN/0htxrV/10uDnf3a/W2HTe9j3oazt0zUBPJuwy
         8Ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379643; x=1788984443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOglgLUq3iAA=;
        b=PGEV0ujMeYd0xQnBoeMxA9Jj6PcwTE2a/DEdCHsR93jD7Tk/3Dz+mLZIUeV0IgxKlN
         CuCnPoD5WUQLcqP7xFBV4eMFoJogWlJB6HKXe3lF4QHM7BuJlhceDP2PFMj+SduXcOiy
         pZdJtYhMCt62c2k/V9GHuqKeFVhvY5sAKOrlzMsbkiJrfiv/rFMfHo1LSaYRJdkEk7R5
         fakWiCD2utIdZDc7FFrBYnFeIxmmEizaANZFn0wDiTTSdlYVvJvRIlf3R52yHrdxekGc
         336mflyaIB7cUX5cLLg0HrMuUNnt6oK/W93MFPw6wdggPxOSjRkdBK+jy6fsO4xAdS4o
         9tdg==
X-Forwarded-Encrypted: i=1; AKwUvBwoc9l6qMj14fPLglJZe2GIBINnXAX1TUtBd20qk1/3EN+LjKGcDoKf4YzWMQAhsg+xJxx6lmY+0z5q5Y78zA==@lists.infradead.org
X-Gm-Message-State: AFuF++myFvm7sHX+x5OfbCj/1X/KVAX1tjzVmILY8k97TOpElC1ZIM1W
	VANgsM6vU68uy/vgoaPr+1QpMG/vrU3WD7WTi5sPih9MhD2PLw/8TZNs7rmKFqxrSoDfv81k7f9
	Zw9GOAhtIcyR34TUiYMe4w3dsbporRlQeLJsdiDCeVoaUF75Y6toZ+rZQAuouC6wFpISVO7yCbk
	A=
X-Gm-Gg: AYBFou272nVqFNUdMBHy2mIikTJeLH8m4fLpMB181XaXEBY4CXzsBLv8IEP6kcvGMG0
	zDY7/U4zo65AyeocS3uncKOw+5wEj6cyq7IVSdxZtxGdwD0DImRlDyCgmP+6fnd4cE351tnnzYT
	uZx3SIv16Smg/upmMwhrlZdcnBQdGiCFt2D5t91L6POtxQ89w75hGvMG++7XfYJnkCPo1NgHRlx
	Wj0VJMAXI3H8B5CHtp59VIcpDpAdj3NzRSVQDDhUoUTetwk0Bus/UWsvCm5/N+4YP3N+wMwv2GM
	JSpAc31kM1a5mwugdss3fZzw2fN7xcqSATvGdTAHHccYVX/4KkPYolS/9T1nQIdGTaAZ48OPlSB
	/OtYuzPM8iZx8KBrXIzekepaPPR0=
X-Received: by 2002:a17:90a:cf88:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39aee9b4d19mr8604332a91.4.1788379643375;
        Wed, 02 Sep 2026 13:07:23 -0700 (PDT)
X-Received: by 2002:a17:90a:cf88:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39aee9b4d19mr8604229a91.4.1788379642783;
        Wed, 02 Sep 2026 13:07:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:22 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/6] media: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:36:57 +0530
Message-ID: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a9881fc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5ojLyFQZJBwMi_iZTBgA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: nJwnqIB-ctkEXmrbTi_ML2Sn028BEivt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX5uL2morWHZKR
 qMpuWPIfhkkQKAUIsKApA94zIyEb9G5uJDh8BAE/AwCq/CKY49q0IS2yCyMP3EFQJxqv850ZEct
 jg87BHd9y/qFu75aVofQcijLUOcQBdM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX4Lz/6zXyMogP
 JCmlWZeFP4w+f4a7bVNil8OhRRnkJDDrve76v+JXkaKCfuzRPbRUQkiJCJ7ZKoSQYrWfyTC6sft
 QNaFoJ2v2n7VJEdMj7RdlPCm5viGmD7hidEGa+K7bbyVt0ClBMiB3Da5tBlS0Is3dCGAjtbBOAo
 SGUDoygE6fhz2qSVMVkT2IpiwJqkWOhKNZOTieeFka2Q15tOyD+/TZcN78oCk/vOpyraw8ioXad
 mVjG5z1/eAtzA1sm8td32ejD8z3CXEzZw9Msxi0JZktEtpZPHvHffarID5neHAjs/gAakIGQech
 Uv+dsIhsIlQMizPP8xu/2wmH5XEXzY9boafB8M14cKZd3OJZiySgL+zsbMllTfXeXOa01DHkKun
 ZTtXxRxONdnT9xHm8H2jlKtT6nNnCP21zNv7GqzWyRDKMh3yy2vE6Jmw/wrrb9tainkip4NEIiA
 iJ2l55ZQUJfyxbLyY2Q==
X-Proofpoint-ORIG-GUID: nJwnqIB-ctkEXmrbTi_ML2Sn028BEivt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_130725_976557_202C64A5 
X-CRM114-Status: GOOD (  11.92  )
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

Several media drivers manually manage reserved memory lifetime by calling
of_reserved_mem_device_init() in probe and of_reserved_mem_device_release()
in remove. Drivers that fail to release on every error path between the two
calls leak the reserved memory region until the driver is unloaded.

devm_of_reserved_mem_device_init() was recently introduced to tie the
release to the device's devres lifetime automatically. Convert the affected
media drivers to use it, removing the manual release calls and any wrapper
devres actions.

Changes since v1: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
 - Carried R-b tag if any.
 - Rebased it.

Mukesh Ojha (6):
  media: synopsys: hdmirx: Use devm_of_reserved_mem_device_init()
  media: aspeed: Use devm_of_reserved_mem_device_init()
  media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
  media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
  media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
  staging: media: cedrus: Use devm_of_reserved_mem_device_init()

 .../media/platform/arm/mali-c55/mali-c55-core.c  | 12 +++---------
 drivers/media/platform/aspeed/aspeed-video.c     | 12 ++++--------
 drivers/media/platform/mediatek/vpu/mtk_vpu.c    |  3 +--
 drivers/media/platform/nuvoton/npcm-video.c      |  9 ++-------
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c | 16 ++--------------
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c   |  9 ++-------
 6 files changed, 14 insertions(+), 47 deletions(-)

-- 
2.55.0


