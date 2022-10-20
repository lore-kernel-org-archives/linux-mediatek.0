Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B2CC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 22:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2G/9Nt1UPxsYT32uFvEw5BhWk6FA6rHpv/vvZ1BQSE=; b=qro43Kjsvc/dulxbbvg1/m0/n0
	9ZYtLYu8WtJ0mayh48cZOJfwSIF1fVk6uZOCVRNqfHcV+y5ARaBr+6kgH8DzIBr3/6az5j/3vz5WB
	spg9cVcGC5KPT0XUrfW66tv92oVxaeHBFhjMeqKrFIut71IEbVNOFu6hYLdrhzKL+kFSu1ofu9tZ6
	LBcaGt/MU6i7LPapFMo8c8pHLD38fSfNEZ56+DaDkVZ5wZ/Ymnnmph3h/bxyJNiNB3lafiYcES5MX
	Zz1IL/5DgZrB81xPTewIarB7hAA6sC6mq46UeP/Yrazcinqp0h/ygQ9wLuskTciwFaYFgdyXXY7q3
	te+plWkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olePS-002Otd-TH; Thu, 20 Oct 2022 22:53:06 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olePG-002OmB-DL; Thu, 20 Oct 2022 22:52:55 +0000
Received: by mail-ej1-x634.google.com with SMTP id bj12so2945481ejb.13;
        Thu, 20 Oct 2022 15:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L2G/9Nt1UPxsYT32uFvEw5BhWk6FA6rHpv/vvZ1BQSE=;
        b=L7KL7Cmq5BeuUdYGMW3cAgtIcuVZg5ASkJ/IZNJWWUiJ+/Qt6gVlScz1u/W2UurieC
         StTRCMiF1gayWtat9yR1jxy03jHzqPRpY+d/GgJ1K8lmNPRqj47kEmjBivrdxwcQlJRP
         gqfaCFKJCe0cSgQC/Xx9MVQoKg98NUMWFRqSK3/+nRYCXn1Q7yrGT4PHRNV43mZeBqb1
         cVtzyuggTcE1Pu9cpikwolaS6fyiZ1HlsdnyB5HAFFtEAPY8oUGlBvmr4xSRLlq7VRIk
         7rfYUfkbEQcY9aYc3JzsWSeJh1CqZ0CXrIEVX1+mmeRiMEa2Rwrz9msL2vRPepDcIKvz
         1T1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2G/9Nt1UPxsYT32uFvEw5BhWk6FA6rHpv/vvZ1BQSE=;
        b=SO5Ui805UGUm2uFAbasQLiKE1EZamWPHBwrmpHi3hYOq3Uq0ERmj3kUscjAPN9+p++
         lvqt91kzyWOHYftBH7hJA4R7SCVZqOp5g/JehyoH8mlA5ApPIzsVzSNostz1zTKtw1hq
         fXajwxc8M9MnL9EQw+BMVab4wQCjGnXpiJ/+jKp33xZS7nsPHF1mVha8StPrONgE0vq2
         BuFdnWD8JtRIDTxHqFOq6QnS8SDxbdAD0iiPhmUYkNa6MGtPxVH/PsTNT4BTrB6BYCqn
         VWAYuSbzAuLLvB2dUT3iMvmUZt5EhkUyLmjFovLFZX/i1KlXGHm5elQAgRgAUd+aaB98
         xfpg==
X-Gm-Message-State: ACrzQf20c+qnGehvz0cMoTYX1yfBJHC0WmIx79+wmaBqTqAAtSHhED86
	SXd0o99sPFUDzqvi+7Z4+Cc=
X-Google-Smtp-Source: AMsMyM5+9yiqphjFjNrH8KW/esDJUp/n6M5wxHkOVHLIro1ZznSRDyfo73CoezEZIlBBqvJ8bUzutw==
X-Received: by 2002:a17:907:9602:b0:780:8c9f:f99a with SMTP id gb2-20020a170907960200b007808c9ff99amr12947250ejc.465.1666306371826;
        Thu, 20 Oct 2022 15:52:51 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id v25-20020a17090651d900b0078da24ea9c7sm10939361ejk.17.2022.10.20.15.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 15:52:51 -0700 (PDT)
Date: Fri, 21 Oct 2022 01:52:47 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: netdev@kapio-technology.com
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
Subject: Re: [PATCH v8 net-next 05/12] net: dsa: propagate the locked flag
 down through the DSA layer
Message-ID: <20221020225247.acy4cejhcmtmf6ua@skbuf>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-6-netdev@kapio-technology.com>
 <20221018165619.134535-6-netdev@kapio-technology.com>
 <20221020130224.6ralzvteoxfdwseb@skbuf>
 <715c068915c9f07ad62d9837e70df7a1@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <715c068915c9f07ad62d9837e70df7a1@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_155254_490735_229A296F 
X-CRM114-Status: GOOD (  10.42  )
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

On Thu, Oct 20, 2022 at 09:43:40PM +0200, netdev@kapio-technology.com wrote:
> I guess you mean, why it differs from the inherit flag mask list?
> 
> If so it is explained in the update to v7 in 00/12.

The following is written there:

|        v7:     Remove locked port and mab flags from DSA flags
|                inherit list as it messes with the learning
|                setting and those flags are not naturally meant
|                for enheriting, but should be set explicitly.

Can you go one level deeper with the explanation? What messes with the
learning setting? Why are those brport flags not naturally meant for
inheriting?

It's pretty hard to take your patch set seriously if you don't provide
proper explanations.

