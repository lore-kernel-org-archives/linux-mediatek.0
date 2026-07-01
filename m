Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569D6C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2026 10:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZMCWACMwzKqJvaEkw4AdQSHyt0FLtQuCecBrJDnzH4=; b=OlESseVNOWXzkkXncTQgw7MQ9C
	r7Ruv9vUBLQe7V2aiYe/Cq75/+jahn/lBFoTRpRWm0uH4iPxcOzOMsmA04pA33PaHLULvxhDSDjiq
	keUvPhKr1LqrPx0aQQr6xmmhDFV86ka9fFp9kKmzCMuZA1lD+pjmWzX/kTFEmBATYrRO/IKjLqzex
	eGGUKGDhnoksxBfFcINFXZHhrR7InOU3cdWSY0jCi+dGNUzcakYjtycPbT6NHgEDPS7s4QQ1zg+FW
	MabSQtyQxdeD8cmUiOdoXdPHlyOWNhQoect25GATg4fsFNtJLSTEtVXoh7GT0VAOU3vRTwNwpLirk
	z/zTjF5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesCY-00000001JOC-3gDg;
	Wed, 01 Jul 2026 10:29:54 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesCW-00000001JNX-3qMj
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Jul 2026 10:29:54 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so1092242eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2026 03:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782901792; x=1783506592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZMCWACMwzKqJvaEkw4AdQSHyt0FLtQuCecBrJDnzH4=;
        b=AH+lshj1/C7mE05DilRX0dmN0UxhsHlE99D/bhaOB/CAH9f3h/D+NqvWSDCPq6JN8Q
         1saBvn7iJqtQpjy+QtPXcy5h8Py71xBcOkzVrB/Qi6fNF+sePOWlZg4iIUpA5MMNopVp
         Qdj/Mh6DezHCBSYoOM26II+ok9hU6jkFe4xpaxmYTGT4sawF4762DqgmkiMsg2MhHOhg
         QVUqxQc6g3oW/6ZnEFSftJbdhUBT+1I0np+yQnm5kOXDABua5jsgtSACRKEbQw3asCP8
         Q3DTHx2iyG6u2sRtT2YKjIkoguWlP5n85OrNYsYaXqAQc3a0POaoKsyYt1i+f2+JmqHo
         +5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782901792; x=1783506592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZZMCWACMwzKqJvaEkw4AdQSHyt0FLtQuCecBrJDnzH4=;
        b=eLOjVu23xrNYGfaMB7Js4iS5fvTD7l1odifiRqsej6YXosK6jfT11M3MeMq+Z5nDpc
         TN+/AqDM8/EbovwPb9hWAAKHe+Gcpn1j3+sQFzikhDH5Q8uduX832rsbJZ16foyEq3O5
         CSX7MFHKSxCYuPP2maWRpkRhhkWkWi8rhLEDXqCRAkAUXuqcwF2kXTRIAs/JPtYl5X3c
         7VbeCDvGANxwCEvNh2UGSofzzwLZl3q3dn5pYP5ukBQCVOTsmEzQTru4+k5zcmvYgdOd
         m+VCER2dEmYYEwB72DCwGIIuqhNseNzlFKkELHxjLffmDfyfETxLm6k4orUIyaqoNhNF
         Fh3Q==
X-Forwarded-Encrypted: i=1; AHgh+RqQ+Lb8XjBtiur5fxvlVg5ia75QFApZN8L0JCh6JFP04sd6LIjqI0vsbuVYfqYE1tI+kG+FkMU0kioW/vbrdw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7rhogMbQjzwI4/MPfC0BtMo9nqQwZ/p7Q89EiRv/FrnRZafQl
	TSDlfA4haVhO3XSyrIYjLI9jT7xweKFfL8nMghJADrp4axnHwWzyQEn0
X-Gm-Gg: AfdE7clm2/vuIbtZa5kd22u9WRS/s0qiWnKNfy+hcmhueyLUbLGdXWxf9ndRRhAKtR4
	MolmV9cAImHwtxWNVNU4hqY3U3L+U1DorDdJTtP+crWNMjQkS6kqVs1zzlUm3B+9X/uPT68v1Tf
	NBYt32Wa+UkzqvAqyU6R9jUycNG0C6pjlWFURIINote1THk6l1y8IIyCnAus4iKurcXCMXX6Asu
	W29Md2u71KQFXfOBe66gA73xNooHpvFmxqRLJKJga2g1PEJt1kPoI1tAn9Bzd3MOzGoSxRULWc5
	LKmglH5WdfSdlbcwqf9eWpaSNT1mSXPTW0SH8SJUrUerE/l4s9D62BhDualFA5PcRDD+tKmLtic
	yP4sXh5Ol+KEho9Pbbn274IWJFo5/pNu/+NfnWlKsy+s2unwvR6uvNXMpYUMt0XdS6FHk7LrDbB
	55YkEOZB3PcewiCfsar+5/DsU=
X-Received: by 2002:a05:7300:fb8c:b0:30c:9f31:b604 with SMTP id 5a478bee46e88-30eff294ff9mr1275666eec.25.1782901791971;
        Wed, 01 Jul 2026 03:29:51 -0700 (PDT)
Received: from nbai25050028.. ([2403:8600:2090:6f:c5d7:7505:b0e9:be5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm27602019eec.15.2026.07.01.03.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:29:51 -0700 (PDT)
From: Aniket Negi <aniket.negi03@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aniket.negi@airoha.com
Subject: Re: [PATCH] net: airoha: fix MIB stats collection to be lossless
Date: Wed,  1 Jul 2026 15:59:44 +0530
Message-ID: <20260701102944.246106-1-aniket.negi03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <akS48y8gCJf-EmTP@lore-desk>
References: <akS48y8gCJf-EmTP@lore-desk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_032952_961426_51197BF3 
X-CRM114-Status: UNSURE (   9.14  )
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

> Maybe better mib_prev?

Ok sure will update. mib_prev is cleaner and more concise. 
 
> Since now we do not reset the MIB counters in airoha_update_hw_stats(), we can
> get rid of the for loop there and just call airoha_dev_get_hw_stats() with the
> provided dev pointer. Even better, just rename airoha_dev_get_hw_stats() in
> airoha_update_hw_stats() and move the spinlock there. What do you think?

I am aligned with your suggestion, Since after removing MIB reset logic, there isn't need to iterate over all devs on airoha_gdm_port. This will simplify the code significantly.

I'll refactor as follows:

1. Remove the for loop in airoha_update_hw_stats()
2. Rename airoha_dev_get_hw_stats() to airoha_update_hw_stats()
3) move the spinlock into the renamed function.


Best Regards,
Aniket Negi

