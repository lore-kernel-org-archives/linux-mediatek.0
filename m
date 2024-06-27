Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E0EC2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 07:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YhATdO6KrQ7DGf5zFpJNQOGA3ipHEvfK6RNPhriw9Wk=; b=RDJ3Fkt2Tknt3PbpJb56AeqYSE
	dTj0seFKOEOMO2e1Y8ObKLA4DIx02+GxUeqc1Q7or2HLAdw52iDhxRt87gA/cqIziXIxtgonHmuFT
	IxM4rsxgBlWIJoYGVc/1OlkvfSasGC+GrjobiYqaLdjUD1CtbqWYg/fBe7cwvse7QenvGRjfN3lQ/
	/pgFFJS70mag+c4GEL3Gnj00hc689K/zqIpiaTU3ko6CPthxxK0In+OU1TTESqG8ivu8kI+06H+ut
	gaiSBAvy7Kbykqx/Zc6pzljiCVMeIDF4StDqBbuhD6L25bjACz9t8FR4EOQ7lKpJxUvKWr0W6t1OM
	Qo/7wTJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMk2U-00000009enp-31Px;
	Thu, 27 Jun 2024 07:59:30 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMk2M-00000009eky-0cAc
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 07:59:24 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1f9d9b57b90so51608425ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jun 2024 00:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bade.nz; s=google; t=1719475160; x=1720079960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YhATdO6KrQ7DGf5zFpJNQOGA3ipHEvfK6RNPhriw9Wk=;
        b=bh3UJb2th8eopWIG+fpG4S6mnrZRac1w3AetMRA2ihtts2MLk4cDMXMSDFFEBGyyV5
         DJYLKW79x+rexfDvIA3v8aSDni0Ta3pPvXM/Zm86bQLAnM+U0kzp3s9MlYMLBqb8aNV8
         ep2HsVfbASrwEseg9HnbiA1xPpfikACNec023hcSiKXHs7z79Sr2Vyu8jInZFDqMi0pQ
         r91tieM18tEqsWUF8NYEAour2B5WOpQpF6mEW6frrirJZeB1JmfEm7dYNoz0rGa42FIZ
         zWTP8WUPt3SuUArrG9NW2r6HpH8xsjJNmM8aklPKjUl4ySPtmvDww/g0fu5U+PahOsI0
         tQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719475160; x=1720079960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YhATdO6KrQ7DGf5zFpJNQOGA3ipHEvfK6RNPhriw9Wk=;
        b=ap97sfUBcKe1PtSjSdTW0OKbYes0SyJl6+s0JplPsDhcsUKt7BMsCzeBP1RcklctFK
         FjNFvswVzWEchcBGrQYeENEEsKyJ7uTlqpzQ+zaZ1FqkdK/hcwuw7gBzWJYrhQZOhP/W
         py9vR2Vwgh8QKkXn31OazwoD7NBFL1olB1vO5HnOpkYqVqF5sRBVFBxi+h7niFKkEom1
         39kIV7Ew0sWIhhnS84wXe0Oi4+j1dujqezdTT/UyIkQ89k1wq+sW3D0dVVymLwMWEz2a
         70gaAx8g8h3DBLqQaCTqx/xn+ybJMFlZ2fLCS3Vf9sRZy3qEpOyKFUTcHJXbW0TZ5X7X
         O5Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUx9a9XkE6ZVagYGPBAt41C+3WBUL7fN7g2bpWZklc6GWmZKgpJl6u09/HiXjlNEczaB7ZBjL6aiyFD+7lJl0S6gJ6KjjzRGmNNgDKSvq2rYL74
X-Gm-Message-State: AOJu0YzxvyyvlbBva15yJcYBBS96az9R7Y3oQD7I1biQD4u6VrWTxDl9
	DqFuxhnblm0sMxepeUTgLsWbP74QNYiZtY/ihXd0QPGkMLaa3IU789GRMxT1Ww==
X-Google-Smtp-Source: AGHT+IEId4xAhY5agqBpTrDO4fZhNU4HUM0EUNs593ufRli/awKIB75mg7lSCq/noyD1uiLh3lObQw==
X-Received: by 2002:a17:902:cf10:b0:1fa:9ea1:bc85 with SMTP id d9443c01a7336-1fa9ea1bd8cmr33387115ad.56.1719475160587;
        Thu, 27 Jun 2024 00:59:20 -0700 (PDT)
Received: from localhost.localdomain ([2403:5816:cd6c:0:6d45:ae2f:1ead:bd58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac9c4cf4sm7181895ad.290.2024.06.27.00.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:59:20 -0700 (PDT)
From: Leith Bade <leith@bade.nz>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	frank-w@public-files.de
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	didi.debian@cknow.org
Subject: [PATCH 0/4] fix up pin definitions for BPI-R3 board
Date: Thu, 27 Jun 2024 17:58:52 +1000
Message-Id: <20240627075856.2314804-1-leith@bade.nz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_005922_523773_F8C9BCA0 
X-CRM114-Status: GOOD (  13.44  )
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

This is my first patch submission to Linux so I apologise in advance for
any mistakes.

These changes were motivated by a pin conflict with the PCIe M.2 connector
and the push buttons. As a result I decided go work through all 100 GPIO
pins using the public board schematics. As I need to acquire a M.2 SSD to
test the PCIe pin change that patch is not included in this series yet.

Working though the pins I noticed a bug with with the MT7531 chip's reset
line which was on the wrong GPIO. Since it was conflicting with the boot
mode switch input GPIO pins I looked into ways to document the use of
those pins with the switch. I ended up choosing a gpio-hog, but please
let me know if there is a better alternative.

I also added some missing pin groups for some of the built-in SoC devices
to clearly document the use of those GPIO pins.

I have actually written up a gpio-line-names list give all the pins        
names to match their usage on this board. If there is interest in this     
I can submit this as an additional patch. I see only some MT8xxx devices   
in the mediatek directory have a gpio-line-names so I wasn't sure if I     
should add it.



