Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FE1CE8379
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 18:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a0PaNusqGE2si3Oije7SU9i4UfymiLLT2bES5lFJf/k=; b=sZu+GCp9iAoMAFNZqTph3II1bn
	HXAIHvtwYMFaUJ4zjCBECeBIxZwFjp6qKQTdQDsmfjmMn9Uu2F4MwbK3E3REmra3Uc10Q+prV0q1I
	H7gJQAj3gox+ikr+UZrce5M2BRCR3mt5BEwYXDJWqAWCeQWpVHe/s3VRmzJfKVU7SZATHz7NLQ+ld
	qVq8/NRsW9WodlzNWsTtUib4diECZzQYex22NjksPKETCuy6z/waLoJtjErkHeO4RDXUSkeSLQkVx
	4O9WnkVmFiSGAYS6lzBMGvwmLLh4UxLLGvXBaztd3i73MFweGdA09ZxKytYmILXCKQ/3WRla0jI5x
	9ffrrAOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svLVA-00000000ZGW-2BFD;
	Mon, 30 Sep 2024 18:52:08 +0000
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svLUm-00000000ZBv-2s5v;
	Mon, 30 Sep 2024 18:51:46 +0000
Received: by mail-ua1-x942.google.com with SMTP id a1e0cc1a2514c-84e844f7a18so1268286241.1;
        Mon, 30 Sep 2024 11:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727722303; x=1728327103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a0PaNusqGE2si3Oije7SU9i4UfymiLLT2bES5lFJf/k=;
        b=GVBgBG7IK/K5n2F/mRLNA4LHQSLc3+1su1WHz31Src8HsaIQuHYq2+blOhHk30CkV3
         6iIt3jFaTciDi5aHUWQtfyl7br9cQsg4zwxxvDDOrW2jrOeDMcDXbui8C5k2S57EumS9
         u1vRIOIxGaCAGmQsXMQwEN4RqOPTt78m70ftVIZnOZqkovYAtQW1Xf8Xw3DcNfAhz3SN
         op1Vet9u2k2c4Dj3CRC5xXsj1+pmc/orVi+hUIjaAd0UX6/R6cpHvuTflV+OsSbczZd+
         4FLk+UrDHg12leE1R7E6p/L80MFkOI30KT8lX77ZhhgOpxueUHAkmWFiXeg75OXW+o0l
         7ZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727722303; x=1728327103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0PaNusqGE2si3Oije7SU9i4UfymiLLT2bES5lFJf/k=;
        b=Aknqu98jQgCvSt/1DVKOBvfPyxTZseH/FdMQ00qy2thYhj6gTAU5B3w1LyKYwT7Xu2
         TdF9OePeAKZXDJMi7FbQkrDZL8q6FwP5RP9rH83r6jPGXrh7RjOKMHVT5Pfeq/Vo+0OS
         9lfzyg/8fegISBZna41eEJDD+ThaLm8DUkrLtICgcp/rEDRd2XAG2up0iQU6RJO1yxJ/
         xQTcKIrlH99yN73i0VCS49SLDze4TPmpmfIwe0kBfB7KLOZrvhSu76sgfFjaLy47NqJs
         960S/Dsw2GA8ECTRAXPjCNS1LNAW15ey1Dp80uODpqxhaVZ2JniFYKH1MnLFALV15aPR
         dk9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUb6+7voGHhZU86vo8y2Z4M0cG67qhr6hxMUyXV8CvZRxJhgpzO5+Q+b4ZYcZo+O4HcQiCaTnsZ2xtyPEiOyA0a@lists.infradead.org, AJvYcCXxxMtatZ56HiVgFLqoIniUZoMQvNsKKBjWq0W4QxrZv2MZlUwTF3RiwQq46G9NKU3eLnr0Nkk2Eu+LvPYA0Rs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcuyuEQWLEhvlThwtMc5sVMH5af+96TiqV4RyjmWhcNBDKYqAk
	lkaZh70FXQ01X+D4hS5zBoUBVxPdcR8ymW3OoBiCn0IyxE6CtCu7
X-Google-Smtp-Source: AGHT+IGId7XNVJc7sViiSTjIxrYxUC12U3qepFT8bzCTMrqQ08yYNE8/Ft8iBGUof8oOt/sYIVQq+A==
X-Received: by 2002:a05:6102:441c:b0:4a3:b777:3613 with SMTP id ada2fe7eead31-4a3b7773654mr3147503137.27.1727722302826;
        Mon, 30 Sep 2024 11:51:42 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45c9f3394aasm38337191cf.64.2024.09.30.11.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 11:51:42 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com
Cc: linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Gax-c <zichenxie0106@gmail.com>,
	Zijie Zhao <zzjas98@gmail.com>,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] mt76: mt7925: main.c: Avoid possible NULL Pointer Dereference in mt7925_change_vif_links()
Date: Mon, 30 Sep 2024 13:51:04 -0500
Message-Id: <20240930185104.19107-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_115144_746438_72DE83B5 
X-CRM114-Status: UNSURE (   9.88  )
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

'mconf = devm_kzalloc()' and 'mlink = devm_kzalloc()' may return NULL.
NULL Pointer Dereference may be triggered in the statement 'mconf->link_id = link_id;' below.
Add a null check for the returned pointer.

Fixes: 69acd6d910b0 ("wifi: mt76: mt7925: add mt7925_change_vif_links")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
Reported-by: Zichen Xie <zichenxie0106@gmail.com>
Reported-by: Zijie Zhao <zzjas98@gmail.com>
Reported-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 791c8b00e112..ea635169497f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1948,6 +1948,12 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 					     GFP_KERNEL);
 		}
 
+		if (!mconf || !mlink) {
+			err = -ENOMEM;
+			goto free;
+		}
+
+
 		mconfs[link_id] = mconf;
 		mlinks[link_id] = mlink;
 		mconf->link_id = link_id;
-- 
2.25.1


