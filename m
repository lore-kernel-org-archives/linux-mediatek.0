Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CADB9CA9EC0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:34:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CEDB20717
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 16:34:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BgG6BsaY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CEDB20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLNB0/SQIvmo0q+cRYVBfIjzlvtbV+vzTdLXa2PHzzs=; b=BgG6BsaYoCkZfh
	gK6PxTqpqDiqoxu2So+HmT2oOBth2OF2eWYyian3+nBVZr041HIThCcrT2wQdjWFJIaVX83KWbHz4
	JibfHfWj1DkwACaDnNwI1KDL6g5H2HrPccY/QjbqZUUbhlyZraZYusIgpY4D3O21hc65w6hA0rz4l
	tH03RiIdrBH7Ylxlxn6l/ICEEqy4WhZypBcFn4NIhKsx4faSSmy2NUrSBnXce8mF6p5A6nI9nmOTy
	Kk3RdWozGdRdcYY09ZgDVOmShh7YqqK5Hc/uZhpubuK7M80HFzoWr5pCxj1g5L50Xt8StTVfxcKev
	mzEF4X8MIlQ0ZiGAgtcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP7xw-0007YR-1D; Mon, 28 Oct 2019 16:34:00 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP7wz-0006f4-T8; Mon, 28 Oct 2019 16:33:03 +0000
Received: by mail-oi1-f196.google.com with SMTP id n16so4145397oig.2;
 Mon, 28 Oct 2019 09:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ly9SwwfQU77PS/De9nePQz9/hgu0i/2+0AP8IGmXD3o=;
 b=KSjVq6CXfFlB8cETJsVtEEsIvZXdEJwQSXSMy77lWs4AO1LebR9LaCaNn1Xvx5+Ub+
 oVGvgenEBJfvI9yq3Dejyr+XO2uoddRbtPEfLHoB2/3yzxTdxB0RhO3F2Bo2fBf+vz9E
 PQ/FRnKg7mESQogoyfA7OjAtX3ilBGatdfO8krePsAT3SmmyflKg3AgMZ+INwlnQ6Onf
 fUyOtNT0ncPikcQ/6uruwAa9NOSNxyg9x39EPdL9HKNGv4hHhLsTffIY1hMLhlPl4ZUE
 8WByOez2Lt8WGHF8iDdJVKrfoAxzbNT7y6MvsJIFfdUkhR5qDD5dS4GMX5Z1aN+EG4Vq
 UkFw==
X-Gm-Message-State: APjAAAUCCtiLEY887x7+7RUl4vvyZ1dzLXBt4byIzsti72XqMEXxO7Om
 K/egZI0bQvbh/vc3JEaSxQ==
X-Google-Smtp-Source: APXvYqz7AvFVl42WcaIBsnF/FBWNvONUeq6ow/pzPzHbo/QsqT4JbiucFb+B7zhfVTYFjNW6To0vKg==
X-Received: by 2002:aca:1e0c:: with SMTP id m12mr168280oic.18.1572280381198;
 Mon, 28 Oct 2019 09:33:01 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e186sm354991oia.47.2019.10.28.09.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 09:33:00 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v3 01/25] resource: Add a resource_list_first_type helper
Date: Mon, 28 Oct 2019 11:32:32 -0500
Message-Id: <20191028163256.8004-2-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028163256.8004-1-robh@kernel.org>
References: <20191028163256.8004-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_093301_937796_BF60994D 
X-CRM114-Status: GOOD (  11.32  )
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
Cc: Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, linux-pci@vger.kernel.org,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>, Will Deacon <will@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Michal Simek <michal.simek@xilinx.com>,
 Christoph Hellwig <hch@infradead.org>, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Simon Horman <horms@verge.net.au>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Jingoo Han <jingoohan1@gmail.com>, rfi@lists.rocketboards.org,
 linux-renesas-soc@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

A common pattern is looping over a resource_list just to get a matching
entry with a specific type. Add resource_list_first_type() helper which
implements this.

Signed-off-by: Rob Herring <robh@kernel.org>
---
v3:
- Rename resource_list_get_entry_of_type to resource_list_first_type

 include/linux/resource_ext.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/resource_ext.h b/include/linux/resource_ext.h
index 06da59b23b79..ff0339df56af 100644
--- a/include/linux/resource_ext.h
+++ b/include/linux/resource_ext.h
@@ -66,4 +66,16 @@ resource_list_destroy_entry(struct resource_entry *entry)
 #define resource_list_for_each_entry_safe(entry, tmp, list)	\
 	list_for_each_entry_safe((entry), (tmp), (list), node)

+static inline struct resource_entry *
+resource_list_first_type(struct list_head *list, unsigned long type)
+{
+	struct resource_entry *entry;
+
+	resource_list_for_each_entry(entry, list) {
+		if (resource_type(entry->res) == type)
+			return entry;
+	}
+	return NULL;
+}
+
 #endif /* _LINUX_RESOURCE_EXT_H */
--
2.20.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
