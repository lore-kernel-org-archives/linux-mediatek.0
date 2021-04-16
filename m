Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB156C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 14:40:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A74D260FE5
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 14:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A74D260FE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M2RxJpistoeOeS3OPT5E4QSK/KuKJZBg3mEtJfJ0ipQ=; b=VMfa+8dU3Fvw2RP82Sri5S9Nc
	7dRaZ9v/+QO4WK/368J03iCUju/l/B033bjOnOfOI/cm3Uy4snBUSG0D+0EOAsDYNFZ6syB+QdkN6
	AeveWtqEypQa6DXuDP3BqZskdTyvnwaEyfB5TThWoeh1JOKvslzc3Ffqd1ayQE0QaJsUXqUYvEHKJ
	AUY5qpiAzomtVpnv/M1b/gIW8+AMZAAFyaG0tCXG+sNmGRdn64RhviB47ZMaulDhtUZGtk/iARNj4
	5SLXTt4bC7bWdOWVmKOInr/ij6WDWyyCKGy9lmlU+kduY0wV9YV52ojuubPYtPISK/bk0TU9dIcRf
	4YZySB5Qw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXPdh-002RLI-6Z; Fri, 16 Apr 2021 14:40:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXPdD-002R9q-2V; Fri, 16 Apr 2021 14:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:List-Id:
 From:Sender:Reply-To:Content-Type:Content-ID:Content-Description;
 bh=h4yT09gtOPwJmvCzcn2SyBTjNFwqbhO6mt/UfjGdg/c=; b=JL+IZ2eTSgySy0dRamQ42KfY5j
 PBz3N5wOXnHy7Q0J9+ORmzjwr+UtFXK0uPgcQIOAvO6EybedwPQY6CMZhzbYjWhePtWbCA8CEo2+o
 yEzvk8T5OlX2YItDIeILHujpKi2Yns8D0CciQ5BhmPbI5texeXNfmVZYGERh0MUlRw5II/a3l5iYo
 JJRPOsG0AZp8d2Czoq4Ghas5qrltKWMZD62ai4On56t2qsPvtY75K04xXN+MkQeYYpDxOcc6lVQki
 tP5lpK4h62C6VB6m9WtEO7JS3uVgFaxqq3A1HHQnvzILRhmY84xlkRcVfKto2vtuCttEIB9yVO64Z
 4IIE+Utg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXPdA-009Sbq-Eg; Fri, 16 Apr 2021 14:39:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21F6861166;
 Fri, 16 Apr 2021 14:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618583976;
 bh=58vezcahFy6vxtKIO3Bsb/7Nc5SiDgR7ddh2WchddHQ=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r96BDK+csmTKWg7xLLHTvz8NkDa2MqhsFwkYxT6JycAUoNqzSkavXd4P21Dvv0y1Q
 7N9IS27BqGw2P/r+M7kPsCAHDvkycmkART2gkvwJNQhbfiz7zB0CqeONqj6QEjXf9+
 xeawciVo6Gx17O/w4VKue0+mlSGwyHodMW1tFDmjkuS8w/eUVp9aMDZOgcYHsn1vrr
 k/hIisWV6YnqDn8aiLro2xdM/9xp+Dd/PSKbv2sGDVecM+BlgTwWxm//Pze9EuWdgy
 ZNhcfHLAIuHjQ5ky6vRJNy9yIvJT77jytrRSrMjXoSGmlLuqjatsH1Akb4TztKQEW4
 n1W8TSyAX4yww==
From: matthias.bgg@kernel.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: mt8183-pumpkin: fix dtbs_check warning
Date: Fri, 16 Apr 2021 16:39:22 +0200
Message-Id: <20210416143923.23406-2-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210416143923.23406-1-matthias.bgg@kernel.org>
References: <20210416143923.23406-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_073936_530080_E6B94D92 
X-CRM114-Status: UNSURE (   9.91  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

Fix unit names to make dtbs_check happy.

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Link: https://lore.kernel.org/r/20210414144643.17435-1-matthias.bgg@kernel.org
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---

 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index eb6e595c2975..0aff5eb52e88 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -32,7 +32,7 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		scp_mem_reserved: scp_mem_region {
+		scp_mem_reserved: scp_mem_region@50000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x50000000 0 0x2900000>;
 			no-map;
@@ -55,7 +55,7 @@ led-green {
 		};
 	};
 
-	ntc@0 {
+	ntc {
 		compatible = "murata,ncp03wf104";
 		pullup-uv = <1800000>;
 		pullup-ohm = <390000>;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
