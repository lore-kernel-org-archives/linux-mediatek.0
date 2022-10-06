Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585D2C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 20:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/Fd7V0AZhPxva2thTU44cSzp0J58T48TzpEQrhv93Q=; b=pz2ezCOkRI8kP2x37Lqr5caWiz
	NomLvZ3YsAthb/9FOXoMXPIKmJmXV18I7Vo/doAs9zaae+SDu/4AnyDbXyyvuICD2XKi06g821FZi
	tVnlrjdmjiyT7i3RMPHHFuU9Q9LWOL0nUQybsT6S2ZfQ75TgaiRUYQ73YaViOA2naALoCLxfKNfZT
	Q5Mnz+EYc2DU0IR1Q4uK2TYwf1Nla6H0ZmRD4sJebtD4lwI0SAEmeLPApF+tYqAXNgbrmDvevl73/
	oGem0OoSPyktri1OTKWuZNh0qhYxDqbOfqfD3LtnBM2iT/iyMPDAGlkEfOMIZCLzYFqt/FMhlsGNz
	aqHi9wcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogXEL-004xQz-1N; Thu, 06 Oct 2022 20:12:29 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogXE9-004xMA-Ny; Thu, 06 Oct 2022 20:12:18 +0000
Received: by mail-oi1-f172.google.com with SMTP id l5so3287261oif.7;
        Thu, 06 Oct 2022 13:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/Fd7V0AZhPxva2thTU44cSzp0J58T48TzpEQrhv93Q=;
        b=gWlaDom5J29Qagg5SjAPZO6QOj6TfwMazGOPLFOh4qSh9zt1WNWQ0OTqQ7RxqY/bTx
         Fx3QwZD15+2LeDGiGon6LQGSe529hN6F8r08/RTmWJPh+5MQt4wg6ZfiYy6A76sxttHR
         xhJ80gSxfoAmgF1RyL3UfmnyH4/ZmtXoRsbRpcbcKaeU0J+fz3gtmRpZhysm7VXGKtgl
         m0tTlyISlZC/jQeJBDE78IDYYob7BxNoZpQ1byvmAC/R5qZJ47wWrp3j2z8saXvqjPEY
         21ek3kdaF6VUfwKD0zgy9zLqxJ4j3KBpbRx9AizO/sbXnDmnS2iIvF0OHs0Elq+ivNhJ
         zYsw==
X-Gm-Message-State: ACrzQf1FrRZOcwk7SJnN5mnYsWt/X0lJd6sw1f8apL5pfSoO8P2VIhLk
	7q8sZZPqEoVbvcJU956n/g==
X-Google-Smtp-Source: AMsMyM5ZJeK4ZyzNfG4rtH8hctFnOJm7aVsdKBQi6FiocwcM81pSr8YMcutx5OsHoWKMapJylMS3zQ==
X-Received: by 2002:a05:6808:1303:b0:350:cba9:197d with SMTP id y3-20020a056808130300b00350cba9197dmr660337oiv.83.1665087133170;
        Thu, 06 Oct 2022 13:12:13 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:8a65:c536:245:842:a3a4:9017])
        by smtp.gmail.com with ESMTPSA id j19-20020acaeb13000000b003430d6696e8sm70461oih.8.2022.10.06.13.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 13:12:12 -0700 (PDT)
Received: (nullmailer pid 93184 invoked by uid 1000);
	Thu, 06 Oct 2022 20:12:11 -0000
Date: Thu, 6 Oct 2022 15:12:11 -0500
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, nfraprado@collabora.com, angelogioacchino.delregno@collabora.com, Matthias Brugger <matthias.bgg@gmail.com>, Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT8173
Message-ID: <166508713049.93127.2543598366027906776.robh@kernel.org>
References: <20221006120715.24815-1-allen-kh.cheng@mediatek.com>
 <20221006120715.24815-9-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006120715.24815-9-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_131217_796322_139CC14E 
X-CRM114-Status: UNSURE (   9.82  )
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

On Thu, 06 Oct 2022 20:07:15 +0800, Allen-KH Cheng wrote:
> Add the mediatek,mt8173-wdt compatible using mediatek,mt6589-wdt as
> fallback.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

