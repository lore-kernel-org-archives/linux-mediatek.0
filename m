Return-Path: <SRS0=h+tY=YW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA898CA9EAE
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Oct 2019 18:41:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DD3620874
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Oct 2019 18:41:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="puVqaKRM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DD3620874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UpdE9tKvznsnZkq5CfL8v9WVCkh7ZJgS1Nc/YG22qYw=; b=puVqaKRM/j2+/J
	sR/t/zsI+VDp05BHXgY6p/C/uhZdYdkTdEGFwpxtyrN7DLwial1AB7aBjb4/pgPw7rruLUkjMj2bz
	C+MXYxLh4CH2uLA2YnnjN3rU1A5QEEDsCxdP8T49GdnY1ENOqX373lYaHPxAHXCeUjWOv8eUdQtn4
	q0sIYbbs1DCRcDWWTZ2RI5UXYpdEDLHvP9f03xCTabUtve6QLkpagAkOLQSL8pt1z0TfbZUk6IPka
	GYYxej0mUCCA94EOOLXp8iW860L8OXg9FXRxZOf+kzIaixN7cEd6/jixyw7uRkVdGAr5yY4vULNwM
	8KwV5frFxIg5nFcn2cTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPWR0-0004RA-Q6; Tue, 29 Oct 2019 18:41:38 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPWQw-0004Q7-AR; Tue, 29 Oct 2019 18:41:37 +0000
Received: by mail-ot1-f67.google.com with SMTP id u13so10700733ote.0;
 Tue, 29 Oct 2019 11:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lCcDgbdqbuBTEikUEcKsB8OyooPRstoWxTDmJWpZKMA=;
 b=uhSwqq9nxH8Ptn6QoOFTG5NQwS8zGSaoQaWpDo2eUHYOLpd9uoG4xlwM477d6tRhCc
 jV4wjCiyF+5CWHWNpg3sLmEMqNxOsGsbp8CIDkI1XI7AStXnT2R59ubwog98Wb0AS6Za
 ovDiRwX4FbvfyW0osPY/i1yWwe2smU4PkwueS69bJem3N4E6S+6ZBqPgDGKCVkEiG5gv
 lI13+qvbJGhYBaBXojmyGJ916MYXeq15hyIEyg3othA5WdB+MZxLd3IGRNACO5iYxfgU
 H8gm7O9wGtlqEtI8lWN169z1nSDw/pPUxO0JGNYC3BZzdDy8xrmcfT3DU+PjpYjAjNy/
 uRKw==
X-Gm-Message-State: APjAAAX00y+8VkE2ulPsYlTf/EZ1nkr4/HxVoYTU2Iz3e/mqAl05IN5B
 M5Z7FeJK6qRIucPdm+Cbvg==
X-Google-Smtp-Source: APXvYqyVgC8Gsnj0NziyjeH40B60+G7bSv4Br+vl1MPHSuG6P0wTssUrdGYhc3TeATcb8OHCX8obxw==
X-Received: by 2002:a9d:5f89:: with SMTP id g9mr18830085oti.227.1572374493211; 
 Tue, 29 Oct 2019 11:41:33 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y4sm4155556oie.42.2019.10.29.11.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 11:41:32 -0700 (PDT)
Date: Tue, 29 Oct 2019 13:41:31 -0500
From: Rob Herring <robh@kernel.org>
To: Wen Su <Wen.Su@mediatek.com>
Subject: Re: [PATCH 1/4] dt-bindings: regulator: Add document for MT6359
 regulator
Message-ID: <20191029184131.GA3733@bogus>
References: <1571218786-15073-1-git-send-email-Wen.Su@mediatek.com>
 <1571218786-15073-2-git-send-email-Wen.Su@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571218786-15073-2-git-send-email-Wen.Su@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_114134_357567_3F290405 
X-CRM114-Status: UNSURE (   9.39  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 wen.su@mediatek.com, wsd_upstream@mediatek.com,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 16 Oct 2019 17:39:43 +0800, Wen Su wrote:
> From: "wen.su" <wen.su@mediatek.com>
> 
> add dt-binding document for MediaTek MT6359 PMIC
> 
> Signed-off-by: wen.su <wen.su@mediatek.com>
> ---
>  .../bindings/regulator/mt6359-regulator.txt        | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
