Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFB1C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 13:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJDvm2qFGqyazE/f3miZk39Ls5Z/IDZ7Dgt1XYVnHJA=; b=0DmVk7nQsyn0j8D5+UBs8WwFWa
	57SvvexoKCHY4Ww+p4peX0WJoUsFNBW50ccZHvL5CARumaXLIy7jjikkVK5beiJiPygmX58wBroWc
	pQREwnw545HPMNOyHvbnSc4JUeajfm7wUxJ7ceu59Qere6eve4hNhjfA1RWmAJqDnkJ5FwWpPfyMx
	OvWHZl9Oe97cVdAceqdyxw/q4TTWSrNrwiNQq6hUXxzs1zIHxSpbxz8sHzpYN+j16Kr/SyYKOP/rB
	WPlJPfWqOVK3b3fdlfRRD+OdmW7Mx2utbAM8W5EM7e8Pd7ESbNXcr4RBcpTyv/HqH6kY7Za/QEA5/
	++BFvG1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whp5Q-00000002d78-1JsD;
	Thu, 09 Jul 2026 13:46:44 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whp5N-00000002d6E-1d6h
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 13:46:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493b77b150aso15205705e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 06:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783604799; x=1784209599; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VJDvm2qFGqyazE/f3miZk39Ls5Z/IDZ7Dgt1XYVnHJA=;
        b=kKuggUx4ujlKywzIEC6m1qtog/LK7GVopxlmDolHppzsK5gEgKItInB3GlCiOeO17X
         D4GHIHqakRDlxnPl1bS+oEDsY4Y+OgZHeArZuVLEAA6yka6Ah5OQ2quZAz2mJ1hgurN+
         mroo9Q/XKi/TXn+Q8Nlab16oisjacILKRDFUl9sKh3wQIS4hbO9tbu8ci9mMa3vLkpCh
         6LbC0tN5Onubvsgd8qE82E2Z3Y1KxfLWcgO8y2IKkTF1tVawVfS87shVVlcImJHDC2BU
         /oH57G26DbkkDl9vYBwaJvmmIV53JZfKp8RwrbG47SnzdsmwUiX+OJFA87NV90AHCxl/
         j5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604799; x=1784209599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VJDvm2qFGqyazE/f3miZk39Ls5Z/IDZ7Dgt1XYVnHJA=;
        b=UwJcuOVY4xKPf2zVmnPz6u1RAJHS6ZIAm7raRC117fqySuL2sOdnZFSTDojMyvLDBm
         6WagrwjrwWmC0NBFcNECi6LLXp5SYwY/TG33dq6MOWV1yOK7V+QKcgRFUdVczNYaFWUa
         T0NvNd1In3DxolafqVclMJZtC8t+q+/DCbTXJ1hXbrDJd8U9yx5E8e2S//YZLP0E7SR9
         GuWAa3+dkqJ+L6rC714JpZQjgIz0SL81cCca2320EKi63azuB30/7Yu9JDElTMx/aWv7
         mk8+9cOrm8uDMdki4ACIVmUXPs5i+ZVdJs4pMJxCqnJ80jiT9vSmPJpEeO8BmmJKyScX
         5a/g==
X-Forwarded-Encrypted: i=1; AHgh+Rp/IioathmYqt9ei5RrUw+r0EPZO8pFngONdhc3m77VGaVjlwVGXtDEQt3vTdZ/pq7BevShex+w7ZoCP6xy3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YztvgdeMAMFwoGmdrvCl5ba21YY/EK8NZEpWLkjEl3SoO9hvfva
	SK+0HTsONSuaoMSdxzqzDiHrpsPYS06AnPS0pEh+bBrNGBsPVYyeD3c/
X-Gm-Gg: AfdE7cll9aqvkG0Nm0VinYrYSWCDPUzAlOeqcsf3qN49j624wyReE5cr7URpCc+9ZK0
	mqvaCaS7bri8p/yzz1O89IVsoTw5j5wA6z3KjHCBs7JuqrWSWV6La3nxgiIsWSZOcQlAwR2XHc6
	RMt0fptgG6PmM1yhMYL7zkTy83MI65x+5+m2MvPZsarnNr8ZjeVOuexisxq6wnxtPYHdEoYkDDd
	Yoxg89N1ip2QXtJfDjZaKwjbnFQsoHgqFMbxMzJufhYx+2jSVq62Pi4oVGXTe4/7uxttkTfmwJH
	7tZqNX4d04XFL3S8OlX0N/N+7TKKxFVyGUSbeALC8Y+FGC3nk3OPB22FkxCrK6+2B8QUGVus42o
	lI7iZrc2aG06XGfNHfXSnEourdbk1Jub4s3F38S9uwwLHnhQpjy+K58Jpc7O9wk6RAxc50rwtlS
	Q+Yn8PDhDpH4/LN+Xv9mKgPHw9tMvy4T+A8jywDyIxGWHbjbnSiu+ylMhSwOZ9CBA=
X-Received: by 2002:a05:600c:4e11:b0:493:ee2b:c876 with SMTP id 5b1f17b1804b1-493ee2bcc04mr21300345e9.35.1783604799102;
        Thu, 09 Jul 2026 06:46:39 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6cccfdsm63149545e9.1.2026.07.09.06.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:46:38 -0700 (PDT)
Message-ID: <6a4fa63e.f4f4081c.1a06be.032e@mx.google.com>
X-Google-Original-Message-ID: <ak-mPUz-V4FANYy5@Ansuel-XPS.>
Date: Thu, 9 Jul 2026 15:46:37 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 2/5] net: phy: mediatek: move MTK GE SoC
 registers define to dedicated header
References: <20260708102341.53919-1-ansuelsmth@gmail.com>
 <20260708102341.53919-3-ansuelsmth@gmail.com>
 <788172f8-1005-4df1-afb7-320a135bdaf9@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <788172f8-1005-4df1-afb7-320a135bdaf9@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_064641_431000_3DA621C0 
X-CRM114-Status: GOOD (  11.46  )
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

On Thu, Jul 09, 2026 at 01:44:37AM +0200, Andrew Lunn wrote:
> On Wed, Jul 08, 2026 at 12:23:28PM +0200, Christian Marangi wrote:
> > In preparation for support of special Software Calibration for Airoha
> > PHY, move the MTK GE SoC registers define to a dedicated header.
> > 
> > It's also needed to generalize the cal_cycle function as Airoha needs
> > only part of its logic (the wait logic) to complete a calibration cycle.
> 
> Can this be two patches?
> 

Sure, will split.

-- 
	Ansuel

