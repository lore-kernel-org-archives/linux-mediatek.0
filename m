Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB495C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 06:26:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53EBE239A1
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 06:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53EBE239A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LyyojsHIhdOrLBA8w8R7EQAx7gGtMcLQ6dEq7dFxlq0=; b=zV9Pcw/l8IO8GqWqR08cdV6i6Q
	wyXoHcZy+M5ecg041/ZnAPZNhmPX2KrkNaGOrCkw22VfU+TApyUoHGa4jZ5JJnQMNyh5bsBn1Bcgx
	o1Ot22hn6BL/7dwIyXl1DF0SCKjswC/EpvE4m4n/WGmgvC0RfpDGbSEYHhAbC5RPymkejLSufjGeo
	IdVXoLXHDyTd7VYR9JVy/FB0YGrpmjkGo51sXrZfB5wnTCJsoLESURDpHCRa+YVve05ATMSMR2Mxm
	r7qO3tPrOFq9WYYo3fDtkYtq266bBfyWkjGv3IhU6haJrdjzz4/Ifw0iEJTnGX00pR+wBtWXCvo9N
	EdphUYAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzw5G-0006VE-2z; Thu, 14 Jan 2021 06:26:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzw5A-0006Sk-3C; Thu, 14 Jan 2021 06:26:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 130582395B;
 Thu, 14 Jan 2021 06:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610605567;
 bh=42C0pdj5Y949qvNInjCRVOhKPbX/Y0ICcm1eaq7sGx0=;
 h=From:To:Cc:Subject:Date:From;
 b=KpWxmgAQaWasCB8P/NGyzyeEO0mxJfq+97d0aGBsc8Ka75pqUpwdy6CiB8xbfb2D2
 8TCsZI/UwKSuBo88NvgC7oKlDSExX4i7dQ2SyvRFUBSt4YgjTVCGxqeVPzt5is8t/k
 /lwa/+sMXPWMY+AqFfCkLdDtCJoGrZ/iWOCUzxsty6lsg0c0/DhHKibgAC37e2AsQ4
 NmOLtGKWvRulS7WvlY84ssOW1FUYmDKdnwzB+NBJRh1mOJ/siJr7fErBMbVxN2ZGUi
 6pblfeIdeMEEgKpNVLw4Hqb5z9BKHKSuTtziEpi5lIeHUKHMLC8LJ3aL9vvGR9tmi4
 E0WeU0Sx5BGIQ==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kzw56-00EJ7C-F5; Thu, 14 Jan 2021 07:26:04 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 0/3] Fix broken references at next-20210114 due to yaml
 conversion
Date: Thu, 14 Jan 2021 07:25:57 +0100
Message-Id: <cover.1610605373.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_012608_363675_F7316220 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Three new broken references were added between next-20210113 and
next-20210114, due to yaml conversion. 

Address them.

Please add those patches  at the same tree as the respective
conversion changesets were added.

Thanks!
Mauro

Mauro Carvalho Chehab (3):
  dt-bindings: usb: update snps,dwc3.yaml references
  Documentation/devicetree/bindings/usb/dwc3-st.txt: update usb-drd.yaml
    reference
  MAINTAINERS: update mediatek,ufs-phy.yaml reference

 Documentation/devicetree/bindings/usb/dwc3-st.txt    | 4 ++--
 Documentation/devicetree/bindings/usb/exynos-usb.txt | 2 +-
 Documentation/devicetree/bindings/usb/omap-usb.txt   | 2 +-
 MAINTAINERS                                          | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.29.2



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
