Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBFBC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 09:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RrkvH0gRv+l0UP75A+9rqrUmYIqI/OyJJH0AXY+BRPc=; b=z1iQb9GHTezri7
	yGeAoCYc2EjEExK3dm9RBk+MguN0a3tE9jNtRVCC5TjjR3KLLycZdAnq+a5CPSJPp/Y/dRkTSsP2K
	IflVK8sLpSHZeLhbWQVxD6bZqB4l3Dy3bINrZCo4cpwwIjwwJeR7oOKG6liaWAPLvAPvCLmymz1VM
	UtSe2uhkW+AlS6buAy0UNTihBB/iY+5cQqd956yCp1uMLJ6rAm2rjJ2iTVQsZHhKTirApsGoNond7
	crEs8DmFmNWvj61HWSslI64QRGEJgyuY6ZWNaFgZpXFQYcVx0+ujYOTTVp6aRFLuS0+dy/asLVdlO
	dSzGyI4U24ELvoUhVLTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAUBC-00AOxT-Vj; Thu, 20 Jan 2022 09:56:30 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAUBA-00AOtG-3E
 for linux-mediatek@lists.infradead.org; Thu, 20 Jan 2022 09:56:29 +0000
Received: by mail-wm1-x332.google.com with SMTP id v123so10860080wme.2
 for <linux-mediatek@lists.infradead.org>; Thu, 20 Jan 2022 01:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=THelF9AcHFILg/clSKwtJV+FOl9TlDxqnyg9R3fkuks=;
 b=gj9EarPr4i2QY/tSbMYppi8r3ipjsqWN6b7LdWMAGx9UkwXqTVYzmxUqomznxtIYiw
 InnuSwozro5CecY65IsG32BuCU484pxjHOCr9YXj0jHuWMuDE+tbXoa9XLT7RixzFyIu
 miaCMAGo9yhlZuZIOHJjyA1V8TY5GU1AMtXgOCYFJ69kwKchZl7ICk2bnKRtsi2SB6L9
 khT1Cj8ZHbIqYtIRHcjTGAcD/E5IwEq4G/gAckbxT96XI1nZujauPAFS+XhqeIpDKLIs
 c1nXYZwMLx4en1wD3U0Bi92v683HoxKeh2PRQAyJAj43kAS369Qos9VOuxg6E7bfpn45
 9g8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=THelF9AcHFILg/clSKwtJV+FOl9TlDxqnyg9R3fkuks=;
 b=IBvTu0qTmcPs5t+23kY4GtkgSM9nLBuTZwSHKCb9IgB9tRedEKHoe0i406PdgEqjdi
 dSWDx8vM5kDq2cwOPrUX3gmc9UvkocytIbJ32fSKLPHptdv+ZX2NHOQDLa3en8Y16suD
 TjGSnZ2rsG6qdSkToOmUeTMmNhqriXQKogxjiJX21xpYqxyorP13nLRYIE7ZLkVFjPLL
 nasazs9QnrKf58uvF0hbEfRSJRQZ7FDH9UdtZKjbsTF4Z237jZYmSLDC2jrtELYCcC3/
 lbpfy3s8d7uh77eQTuXu5x9tpWAL1F1UDxqu9Jm1j6+e4iDao9ObjeYGCe8LLPVVw/0m
 xrHA==
X-Gm-Message-State: AOAM5319xwqweRikRGPDvNQphmmT2AJmkveN3u+3Q/kyoMLeskCPt7Pv
 QfPy3QrWri6XuAo9LP1SDOXiAA==
X-Google-Smtp-Source: ABdhPJyL9QZmwPHpey5LtBNegeYZr+Kxgc93tZ6lJq4WC4G53xuv/D7lv0La0EphGHiB89XfgN2+AQ==
X-Received: by 2002:adf:efc2:: with SMTP id i2mr34911887wrp.89.1642672584382; 
 Thu, 20 Jan 2022 01:56:24 -0800 (PST)
Received: from axion.fireburn.co.uk.lan ([2a01:4b00:f40e:900::64c])
 by smtp.gmail.com with ESMTPSA id b15sm2277755wrs.93.2022.01.20.01.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 01:56:23 -0800 (PST)
From: Mike Lothian <mike@fireburn.co.uk>
To: khalid@gonehiking.org
Cc: Deren.Wu@mediatek.com, Eddie.Chen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Eric.Liang@mediatek.com, Leon.Yen@mediatek.com, Mark-YW.Chen@mediatek.com,
 Soul.Huang@mediatek.com, Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
 YN.Chen@mediatek.com, abhishekpandit@google.com, ch.yeh@mediatek.com,
 frankgor@google.com, jemele@google.com, jenhao.yang@mediatek.com,
 jsiuda@google.com, km.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com, nbd@nbd.name,
 posh.sun@mediatek.com, robin.chiu@mediatek.com, sean.wang@mediatek.com,
 shawnku@google.com, steve.lee@mediatek.com, ted.huang@mediatek.com
Subject: Re: [PATCH] mt76: mt7921e: fix possible probe failure after reboot
Date: Thu, 20 Jan 2022 09:56:22 +0000
Message-Id: <20220120095622.1938-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d291f592-d84a-2ffe-7f75-df77890efce8@gonehiking.org>
References: <d291f592-d84a-2ffe-7f75-df77890efce8@gonehiking.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_015628_225247_77545FB0 
X-CRM114-Status: UNSURE (   7.88  )
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

Hi

I get a BUG and the kernel resuses to boot with this patch when mt76 is compiled into the kernel

https://bugzilla.kernel.org/show_bug.cgi?id=214557

I don't see this issue when mt76 is compiled as a module

My .config is at https://github.com/FireBurn/KernelStuff/blob/master/dot_config_tip

Let me know if you'd like any more info

Cheers

Mike

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
