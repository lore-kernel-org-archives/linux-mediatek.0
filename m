Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0771C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 13:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmxhzVAL1YB+RE9j89rBigO8T8NiP9SDGEamja0kPTU=; b=dG5dMo1qucF3xBvpeZnBWjaVfb
	dvkxhLq72WiDjT01JisM8k1nuVe07Z0vga1iVRdmDF0j8pkdxBzEalQiRcpWSv2jYdEn7VrLij9RN
	l97wHYfoNIoHVTdft8TzLYgAEYKc0RS4x/dQVVDcH8PZNXxbI2BXqB7DFpPzkMHgWUtq8aEocHrxS
	zbvDfFf01kbDNIw+vmut6iZXsrH3wuA6eg6qmg/DJgjj0ut/eLy1ZuX8m3yW98MjUqqLUFrQ9H5St
	yAa6fyxVfvJZ10kUfgt86hDY8jaFFbccMmLg4niiHOoGqSeY090wu0M3sb51fvo9AZa3G7p4hwLZx
	AuPjZbfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olVd2-00FTxl-Qy; Thu, 20 Oct 2022 13:30:33 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olVLc-00FJCU-AY; Thu, 20 Oct 2022 13:12:33 +0000
Received: by mail-ed1-x52d.google.com with SMTP id u21so29820297edi.9;
        Thu, 20 Oct 2022 06:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cmxhzVAL1YB+RE9j89rBigO8T8NiP9SDGEamja0kPTU=;
        b=mtCezQ/4ENLZOEF1WPhS7b4U4jsIGRd8/PAJOEm4TbfJXF5yRk8XLRAdPGb1rZLIEM
         p/oxZEQmdwWqqUzKL/pPjO8GgLAAJ5r5hhmM34UPgM2OefKojgPmrTT91upH6Idws/FY
         ggCCKG5kyBEaOPcLbYuFVfsMgl9HGFLc9LowwDzC/70CU5++MaQRW0jxIwp/MtZ4Njb8
         g7nXKV6aP1OMxofbQWswWF1s7ZavDCGMKolxCBlolWPqeoVZ0K9oZ3YFJ8cdDNSNXlQs
         Rv487MwL3WQScTQ1iSPS1IcoxpYanEBF8b2q4R5j1hQiKwsY70oHAanDE4HAvgVLUdTa
         gBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmxhzVAL1YB+RE9j89rBigO8T8NiP9SDGEamja0kPTU=;
        b=XC0ncHMkOHkVl6lgtF1gqAkTquESRkh/3F/Z6GzVFOpidNghZ6U5YpjhoQPbc2TRbm
         HTJNmZ45tFQSoDVbu6GfiDiZVres17FKwDdEylCIA05CDEWfYh44jhlDJ8Wo0fzgi8tp
         Jwip1hwp1BNwzdt6s2eAS8jtd6BOaxVRRR3uaDiK0psyqXepdC8g4l/Er5XbgiNuGlw/
         UtVv0visqqZ7hnCxOaNUnivdTjoLZS1JSljuKNjJD/7A5wiIvKFlb4/0cFS9/eMrM9pr
         206uidE207FMjO+bAvrwblRTua85imGA/8CRwzIWDdrGD7LUc2vcTRKmyhror/MwOXRl
         1bjw==
X-Gm-Message-State: ACrzQf0GZ/DpXSqNeKJ6aTr2sShcZQU+iPmKgazItgGt8/SeIVsyHbBR
	XxHl+jYPzGXETOUuKdhkuxc=
X-Google-Smtp-Source: AMsMyM4Ro4f7VYfhx3De04CJsNdaKBFDdssfYHLOp4Ppvmyr+30/eGDqR8g/m7v0AgMhLMN1ZRJjHw==
X-Received: by 2002:a05:6402:d75:b0:459:fad8:fbf with SMTP id ec53-20020a0564020d7500b00459fad80fbfmr11979743edb.0.1666271546990;
        Thu, 20 Oct 2022 06:12:26 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id p7-20020a170906784700b0078d9e26db54sm10373833ejm.88.2022.10.20.06.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 06:12:26 -0700 (PDT)
Date: Thu, 20 Oct 2022 16:12:22 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Hans J. Schultz" <netdev@kapio-technology.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com, Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Yuwei Wang <wangyuweihx@gmail.com>, Petr Machata <petrm@nvidia.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Florent Fourcot <florent.fourcot@wifirst.fr>,
	Hans Schultz <schultz.hans@gmail.com>,
	Joachim Wiberg <troglobit@gmail.com>,
	Amit Cohen <amcohen@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 net-next 08/12] drivers: net: dsa: add fdb entry flags
 incoming to switchcore drivers
Message-ID: <20221020131222.fzgq7ashy6cdatyt@skbuf>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-9-netdev@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018165619.134535-9-netdev@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_061232_454810_40EEE766 
X-CRM114-Status: UNSURE (   8.39  )
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

On Tue, Oct 18, 2022 at 06:56:15PM +0200, Hans J. Schultz wrote:
> Ignore fdb entries with set flags coming in on all switchcore drivers.
> 
> Signed-off-by: Hans J. Schultz <netdev@kapio-technology.com>
> ---

Some very thorough documentation in Documentation/networking/dsa/dsa.rst
is necessary. I'm interested in seeing what those flags are, and what
are drivers supposed to do when they see them, other than ignoring them.

