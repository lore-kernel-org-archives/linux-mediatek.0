Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102A8C46CD4
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Dec 2023 21:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LXfvJDZMYr06hSjzDAHn45R5+yBGyiltXIa/WtMIqNk=; b=mxIxOQFKhAsrMQPH/HwLlce2xa
	ypJ8xDaahJuoaVZCe8soyyTkvt/OEvpe3oArrVuxWbNy7fwUk9NeNxU4GqopdIo5K0ywPVqzow7gV
	2fiJz3EEWSMEY27mmQlIGsCVfsU3DahTn4/8OgkvoVXqcMtj2HpohF2zcDWfEU4Az3MDvJc2fH88+
	1axam2gUxlYyJbMoNKqkT0EhMA6CDrwCbqSzLh2uy5SMuOaVvyc9aYF7iVqBNijOpvg5EDoMLcZB8
	YO07Ztp+PhJRA64gZAzEVqu3Y1vlV4AXkru/c2ouTEGRzSQk5Y2RA3AvevRCch1NXztYGAKh13QUb
	2KUJZsnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJKRh-001a04-0T;
	Fri, 29 Dec 2023 21:31:09 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJKRe-001ZyC-0e;
	Fri, 29 Dec 2023 21:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703885462;
	bh=h3ANz3W0DslZaQwI4kM53iFECoCiLF7i5w4P/6cAJS8=;
	h=From:To:Cc:Subject:Date:From;
	b=3gOIgpCN0rHmhUVUO1x2NnY6I/4ngpObwu+s2JXdw+Ag6ioDeIyjdvrO/Uk+g24Sq
	 D7Ne+1Ni/VgEbpuKRL05s5UI27ctN3ZkHkPeyWm0iAlwHZ7ytovnXYUueBkoukDqF9
	 UjNMiOP/HVjzYwyncI8WR8sMPsAbOpIz08kRmfrVaazWFSIU22xTHrEe7Yym8yFj2n
	 8mx5y53Iy/5e4FPWcsgN+9YDVEefyQ0LLxiqTW5vhXwLURDC58gwj0FBH/P69XU/7w
	 YwoqaLOCC5jW3B4Dgun60zgg8Bice0jLp0IkvzslrLeytSWfTv9NQqD5card03KGyX
	 ZVcVV3emGe49A==
Received: from localhost.localdomain (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 44A0E3781FD5;
	Fri, 29 Dec 2023 21:30:56 +0000 (UTC)
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Yuan <hector.yuan@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: cpufreq: Add big CPU supply
Date: Fri, 29 Dec 2023 18:28:39 -0300
Message-ID: <20231229212853.277334-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_133106_452147_CD686D0E 
X-CRM114-Status: UNSURE (   9.22  )
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

The performance-controller hardware block on MediaTek SoCs is
responsible for controlling the frequency of the CPUs. As such, it needs
any CPU regulator to have been configured prior to initializing. Add a
phandle in the binding so this dependency can be described.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 .../devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
index d0aecde2b89b..d75b01d04998 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
@@ -33,6 +33,8 @@ properties:
       performance domains.
     const: 1
 
+  big-cpus-supply: true
+
 required:
   - compatible
   - reg
-- 
2.43.0


