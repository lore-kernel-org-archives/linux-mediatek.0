Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00E0C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 08:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VrQBGmBaWzNo6fmwHbVrfa8ebDP1MIeU2AsbT/SRY+Q=; b=IFgCJO+fxM68y3
	6joMUginshgWR/Lds8xg0sdn0uDVujNFTxqvL4FcA5W+mxxFVYq8eoMj5X5BwDsrD5cKh4MOim6Pr
	Sk2oKGH6MYnkVOWW3TfDtBydCJzaRiCFAWn4O9Ayr+gmP07BQ0LiTTTehpIQjgoUydTvdliXVwCD1
	BxEkKoS56wpmmLKlDPG8OfBKOHi0y1fgacS0Y09tLfthVoHk9NF67RRITb2vMhGxUub9C5ywzJROD
	a6Gv/zF6u7nZD91R15veEXiKKw3bN0eE8BMJ1FEbDa4lIdn9RpROf/GMkc50yDkWaaQVBJU+KbgkE
	t1t+pJ8qL3ZHE4W4V0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzaJT-006uSG-Qe; Fri, 10 Jun 2022 08:48:15 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzaJQ-006uQL-Ub; Fri, 10 Jun 2022 08:48:14 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A7WKNX005267;
	Fri, 10 Jun 2022 04:47:50 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3ghq33kq7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 04:47:50 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 25A8lnqA027535
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jun 2022 04:47:49 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 10 Jun
 2022 04:47:48 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:47:48 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imig014275;
	Fri, 10 Jun 2022 04:47:36 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-imx@nxp.com>, <linux-renesas-soc@vger.kernel.org>,
        <linux-mips@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <chrome-platform@lists.linux.dev>,
        Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>
CC: Cai Huoqing <cai.huoqing@linux.dev>,
        Benjamin Fair
	<benjaminfair@google.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        Linus
 Walleij <linus.walleij@linaro.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amit Kucheria
	<amitk@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Hennerich
	<Michael.Hennerich@analog.com>,
        Haibo Chen <haibo.chen@nxp.com>, Benson Leung
	<bleung@chromium.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Alexandre
 Belloni <alexandre.belloni@bootlin.com>,
        Christophe Branchereau
	<cbranchereau@gmail.com>,
        Patrick Venture <venture@google.com>, Arnd Bergmann
	<arnd@arndb.de>,
        Nancy Yuen <yuenn@google.com>, Sascha Hauer
	<s.hauer@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gwendal
 Grignou <gwendal@chromium.org>,
        Saravanan Sekar <sravanhome@gmail.com>,
        Tali
 Perry <tali.perry1@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Thara Gopinath
	<thara.gopinath@linaro.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Lorenzo
 Bianconi <lorenzo@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Andy Shevchenko
	<andy.shevchenko@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomer Maimon
	<tmaimon77@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Nicolas
 Ferre <nicolas.ferre@microchip.com>,
        Jonathan Cameron <jic23@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
        Shawn Guo <shawnguo@kernel.org>, Guenter
 Roeck <groeck@chromium.org>,
        Fabio Estevam <festevam@gmail.com>,
        Olivier
 Moysan <olivier.moysan@foss.st.com>,
        Eugen Hristev
	<eugen.hristev@microchip.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 20/34] iio: inkern: only relase the device node when done with it
Date: Fri, 10 Jun 2022 10:45:31 +0200
Message-ID: <20220610084545.547700-21-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: SkfWEkHBuamWrqTrmnu36au12Kn0EwdD
X-Proofpoint-GUID: SkfWEkHBuamWrqTrmnu36au12Kn0EwdD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=924 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_014813_047861_86D9D220 
X-CRM114-Status: GOOD (  13.49  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

J29mX25vZGVfcHV0KCknIGNhbiBwb3RlbnRpYWxseSByZWxlYXNlIHRoZSBtZW1vcnkgcG9pbnRl
ZCB0byBieQonaWlvc3BlYy5ucCcgd2hpY2ggd291bGQgbGVhdmUgdXMgd2l0aCBhbiBpbnZhbGlk
IHBvaW50ZXIgKGFuZCB3ZSB3b3VsZApzdGlsbCBwYXNzIGl0IGluICdvZl94bGF0ZSgpJykuIEFz
IHN1Y2gsIHdlIGNhbiBvbmx5IHJlbGVhc2UgdGhlIG5vZGUKYWZ0ZXIgd2UgYXJlIGRvbmUgd2l0
aCBpdC4KCkZpeGVzOiAxN2Q4MmI0N2EyMTVkICgiaWlvOiBBZGQgT0Ygc3VwcG9ydCIpClNpZ25l
ZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+Ci0tLQogZHJpdmVycy9paW8v
aW5rZXJuLmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9pbmtlcm4uYyBiL2RyaXZlcnMv
aWlvL2lua2Vybi5jCmluZGV4IGRmNzQ3NjVkMzNkYy4uOWQ4NzA1Nzc5NGZjIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2lpby9pbmtlcm4uYworKysgYi9kcml2ZXJzL2lpby9pbmtlcm4uYwpAQCAtMTY1
LDkgKzE2NSwxMCBAQCBzdGF0aWMgaW50IF9fb2ZfaWlvX2NoYW5uZWxfZ2V0KHN0cnVjdCBpaW9f
Y2hhbm5lbCAqY2hhbm5lbCwKIAogCWlkZXYgPSBidXNfZmluZF9kZXZpY2UoJmlpb19idXNfdHlw
ZSwgTlVMTCwgaWlvc3BlYy5ucCwKIAkJCSAgICAgICBpaW9fZGV2X25vZGVfbWF0Y2gpOwotCW9m
X25vZGVfcHV0KGlpb3NwZWMubnApOwotCWlmIChpZGV2ID09IE5VTEwpCisJaWYgKGlkZXYgPT0g
TlVMTCkgeworCQlvZl9ub2RlX3B1dChpaW9zcGVjLm5wKTsKIAkJcmV0dXJuIC1FUFJPQkVfREVG
RVI7CisJfQogCiAJaW5kaW9fZGV2ID0gZGV2X3RvX2lpb19kZXYoaWRldik7CiAJY2hhbm5lbC0+
aW5kaW9fZGV2ID0gaW5kaW9fZGV2OwpAQCAtMTc1LDYgKzE3Niw3IEBAIHN0YXRpYyBpbnQgX19v
Zl9paW9fY2hhbm5lbF9nZXQoc3RydWN0IGlpb19jaGFubmVsICpjaGFubmVsLAogCQlpbmRleCA9
IGluZGlvX2Rldi0+aW5mby0+b2ZfeGxhdGUoaW5kaW9fZGV2LCAmaWlvc3BlYyk7CiAJZWxzZQog
CQlpbmRleCA9IF9fb2ZfaWlvX3NpbXBsZV94bGF0ZShpbmRpb19kZXYsICZpaW9zcGVjKTsKKwlv
Zl9ub2RlX3B1dChpaW9zcGVjLm5wKTsKIAlpZiAoaW5kZXggPCAwKQogCQlnb3RvIGVycl9wdXQ7
CiAJY2hhbm5lbC0+Y2hhbm5lbCA9ICZpbmRpb19kZXYtPmNoYW5uZWxzW2luZGV4XTsKLS0gCjIu
MzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
