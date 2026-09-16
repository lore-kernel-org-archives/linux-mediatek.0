Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4733C88E5C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 13:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rLqupxzjXmzvfUPsB8zm1Mahn5C+EFV39FmCjpXtCPE=; b=dccoPIsIXykb7kzbw3Pgt87UD8
	iPtfE+yacu3JD5jOB0EZuiuiDAHJhT3ppt0Z/UfZnIpFG/uiDDx2jiAB7IC5xV039vkSO/nmssADr
	m0OpW7XY9Vlf5xo6M44G8TyLgrC1bcElg0bM0A4v2CcUTG80c5KBT2m0w85T7rJ4A/Mq6jP4G5TG2
	0xlDTxt91X9+LHK1wImWkqzfl6ZRzPE4cLGw5Cois3+2G0M/Ib6sajNQKZOa7J+0PPTAeLysBhUb+
	7+3EL+ttKXTzUzSy/JVEs0gpscdkJD9ilc+S+bYXCmA7NhfaubvZSWVjNTaKmd2h00c1GPHNYOgOL
	K9Cf/OQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6piy-00000009GX8-0NoH;
	Wed, 16 Sep 2026 13:30:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pis-00000009GVk-0iG5
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 13:30:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GCYS7d3843672
	for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 13:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rLqupxzjXmzvfUPsB8zm1M
	ahn5C+EFV39FmCjpXtCPE=; b=Gys/7DUhcmYcSGG/8N80nL+MQLYqGttWhw+nxa
	2x7fiei3Qw+Vo1JQ1SEXrqJhTsPsvAelZ3DDOEMnHlysX7fi/C2vQAzDNH3PN/eD
	h2+bw+u+qt2MIw2JVaGUd/66bUCvA1mN6yW/TPI87C/Ij8kHq479GC3fWgr5Yepd
	+xxcp9XRpLcWkTL7EZDkdZi5rck7D5Y7/BI/UO1RaQiVoEkqlWssYYPt2/rEHHIo
	SOhlxdnjW7CK3ILTvhrhmQ3TWVPC3ntMyLYWGvsS+RE8L66yfFyOnwAudKYXPVsv
	XL2XqhGnKd5J1TUml6qNg3GDW2pFQGAZmmv66uUWBq2WUdCg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefpbc05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 13:30:37 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-982fcdd9b01so430453241.1
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 06:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789565432; x=1790170232; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rLqupxzjXmzvfUPsB8zm1Mahn5C+EFV39FmCjpXtCPE=;
        b=BOLv6+w5lDhACP+bfEC9BnYRjEVxe72P60m4HDGN0gvsXSFcPjQkgBd/wRe4EEqtGk
         5oTaIVKRHtn9bVXfzThGeEg4Xl/aGSclPXsyZhIyTQgGkTf1PgqrLRuGQrSdBN5UAp/h
         sYCtT2FZ1ZndzlGfiN4vjplmk5uPUyrnzVjHmnKO5ANOwqnIIDeKGvPZ7pofbMWkpauq
         BGMFNKH8QxWOl38nyWaweo7toqhrFrOo0Wxf4CHxMl83KmJMGbI1u1sK0qAtI3Pr1zEh
         75Axx3Q4McqcyFr6tpwR6HpuraLmHlx78wJzh9gA+c3tRocUQAm21ts8Iqq379YKoQfc
         xeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565432; x=1790170232;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rLqupxzjXmzvfUPsB8zm1Mahn5C+EFV39FmCjpXtCPE=;
        b=AjO47zr++38aGYOxyMVyzIwj5jHtte90UHn2a3oh79sRMlDvvqQ/mE6l6eoDIeXUm1
         avAnVSx7dQyndQoft3+Ih8dZ17JBGPN1DR1awzc1ODG9Kzqt/b7ZVSir8Bz9dWezXUql
         n/E3j/J8OXuPKj9vtfU3VF8H59KwUS210RxWyqjsmbQpztWzSsOWppFedsT5dYWqvjwI
         TAog64PPwwAWhrWN+n66svKr0mLlcpKla2U8MKooQlPc4KbVuP28pt9Yjdd99I72jXYH
         lNWbONtBD0NHIe2cjz6PQXyy4KZbGwErPlFuXIlbQcAYlZ2DmJPbpWJoYOZW/JBKp4wF
         NACQ==
X-Forwarded-Encrypted: i=1; AKwUvBwp1cLVxa27KQl94agDqIG+k5sOuG6McBGis+UAEq8+78dcBEjuk+xXZHbUq+FVUtJCgRwf1kWRKLEI3lIDvA==@lists.infradead.org
X-Gm-Message-State: AFuF++lgvvaFrXl/RfPMMmrpC0gcB0+/rlYy4agP8L69td/n6UOPJILj
	hmpEAkpzMO3yc9+9UkPqpuwVhS97ZFehTSztg0VAsyPfuNe8wDPVpgEchgmpDXReY3JfFKpFDb8
	3Fhz2LBwtYlbi3otuIWLbdWtXE1OygjLdEZ4siU7ir2uZFvApMFqu6ppUsuTvOqwcfCHPKsGqtU
	w=
X-Gm-Gg: AYBFou2sqtvyXYgXZd3E/fgmLhnfQsIvV5scyEYhqHqqlhqo9HVObk8DZjEs5VBOsD5
	f5g3Z/u4oG/MCx/Zu6kHqqB518qIdZwqBbtNbMKfNn5SMk72SYZZlBglAqeX5l98Fl2RSdWjjoX
	jraBlJ/dcWcpeS87RbqYi+CejzrN6+ksQe0gdSHKx3Ed/fA4kD0PSLytSw+cO4J1ve9J+9zINeJ
	I2B7ORuiUQ/Me0ueIn9PEsJmoCRWKbsFznUn86jKb8btPL5vD8genLc2MqI3H8REbcdGVpBve2N
	p4QcX7gQ+P/IoJXxOpddqMD0ikFwS9ZgyCsLy6AiGMEri1rzAMeTHVaNec2rjYI+D5aZtl9gacK
	+rwgiFgBWITSD5A==
X-Received: by 2002:a05:6102:1495:b0:79d:dab6:66c5 with SMTP id ada2fe7eead31-7a024dcd3a9mr2963956137.2.1789565431511;
        Wed, 16 Sep 2026 06:30:31 -0700 (PDT)
X-Received: by 2002:a05:6102:1495:b0:79d:dab6:66c5 with SMTP id ada2fe7eead31-7a024dcd3a9mr2963772137.2.1789565430895;
        Wed, 16 Sep 2026 06:30:30 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5b22b2sm136121366b.36.2026.09.16.06.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:30:30 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 15:30:13 +0200
Subject: [PATCH net] net: ethernet: mtk_eth_soc: unregister net_devices in
 case of probe failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-mtk_eth_soc-netdev-fix-v1-1-5dac50eb65b1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MUQqDMBAFryL73YUkVqG9ipQg+lKX0kSSIIJ4d
 xc/5zFvDirIgkLv5qCMTYqkqGAfDU3LGL9gmZXJGdebl+35X38edfElTRxRZ2wcZOfRdQgtume
 AIT2vGTrf4YHUo895XppOe8ZtAAAA
X-Change-ID: 20260916-mtk_eth_soc-netdev-fix-a25ef3e54fe0
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Sean Wang <sean.wang@mediatek.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE4MSBTYWx0ZWRfX5DHkce+LDQVm
 3iG9pGlYe0C3sKe78tK/Xc4hkeZDjTTGzrZgAEcDUdDAWhWePi+EPARmeKE31XFHFrKxED/DOXN
 kP0O8hMlMhUwZQ8L5ZvG9M6ysO6Z620=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaa99fd cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=q-zEs5IEZV_uNfpMk_gA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: YGlcmP4CdG6csETWkJsTVRnShX2Qc6Wf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE4MSBTYWx0ZWRfX6DP0i60h9xHE
 GOtKSfwHHcoE00ZYXIrZAsHP6HyuXWSJO7tjpqMV9sID/IWBnE2pGokGszYEBGmlKhyP/KrkFTG
 l1JjR3AZ3lcBnh6gDPsj58/pNqGSreOqODBsoip0CcYyoc37fU6WCU4j5Im2qh1wajGkqJecNFo
 MfqLuq+4dnZAaKLcDFENLmg5T6FvXXihButYQD/jFoHyym5r1y4xTUAqpVQueVZwA+6gjWQNWTs
 9BvgC4kIhx8Zd6xNk2lh1NX/ya94zUG+Pw7cYvZbzJ8LJ5aqPEVMgh/OVN6MLNkdVD3JA1PrSyT
 NE2aiXarUMIA7QrarOw3u91endcmTvWLo4SI/3J79yYpIphJAOJgGZhUKrUQqeoUOeD3JfZaRuT
 Cq/Zt4xfAzxjf2MbDOTdHp20lLACDOUWiQO6u8A5XZzXzlKxz5beXqC94MGSPljTJlZ+lGEkcBE
 0QzylSvvMArgRrFmzRw==
X-Proofpoint-GUID: YGlcmP4CdG6csETWkJsTVRnShX2Qc6Wf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_063050_301926_60EA22F4 
X-CRM114-Status: GOOD (  14.28  )
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

If register_netdev() fails for one of the MTK_MAX_DEVS devices in
mtk_probe(), the error path jumps to err_deinit_ppe, skipping
mtk_unreg_dev(). The previously registered net_devices are then freed by
mtk_free_dev() while still in NETREG_REGISTERED state, hitting the
BUG_ON(dev->reg_state != NETREG_UNREGISTERED).

Route the register_netdev() failure to err_unreg_netdev so the net_devices
registered so far are properly unregistered before being freed.

Fixes: 8a8a9e89f801 ("net: ethernet: mediatek: cleanup error path inside mtk_hw_init")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index fd7a49ae88d0..2ea5dfe85539 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4509,6 +4509,10 @@ static int mtk_unreg_dev(struct mtk_eth *eth)
 		mac = netdev_priv(eth->netdev[i]);
 		if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA))
 			unregister_netdevice_notifier(&mac->device_notifier);
+
+		if (eth->netdev[i]->reg_state != NETREG_REGISTERED)
+			continue;
+
 		unregister_netdev(eth->netdev[i]);
 	}
 
@@ -5344,7 +5348,7 @@ static int mtk_probe(struct platform_device *pdev)
 		err = register_netdev(eth->netdev[i]);
 		if (err) {
 			dev_err(eth->dev, "error bringing up device\n");
-			goto err_deinit_ppe;
+			goto err_unreg_netdev;
 		} else
 			netif_info(eth, probe, eth->netdev[i],
 				   "mediatek frame engine at 0x%08lx, irq %d\n",

---
base-commit: ceac0de741bfb47ca255eee075257b3bb31f0651
change-id: 20260916-mtk_eth_soc-netdev-fix-a25ef3e54fe0

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


