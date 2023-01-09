Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4297CC54EBE
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 23:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rszgv4ftpflSP0hfAbu9auGucePJ+YbSLRVLVyYuDXk=; b=wV4PYEbXLg59maiqa/1e/kUhPk
	tAElbkpwEVZ4EkA7ZtqhIg+nxRhtEmx980bOYQhWmn+JjzJQYakxppEZapZUbvj94o0RmJvywcXuk
	fJwExRDNvhhZTaj3R9WtbCKY+XzbUCOw9Cmp/DY0WeIO1+pzpZPnsojsxdD4ovPE7KNKN7/Jxep1R
	CaKFf80iuq2N6rAn+0IVi6BLeD8a2s5cj1Gvjz+ZFtOQPwk+tJDpSOHJY7DPP6rIvNA2W1gMBIxGi
	NrcPb4UX1SIrdSbpyqQlpHdBl6noAwPEdhTAbc6toPmTlJNmnN9jVSaxH1ycD7NQHelvWXTzW5ZPZ
	f8b/Ei6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF1tF-004g7C-Sk; Mon, 09 Jan 2023 23:49:17 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF1t2-004g0v-Li; Mon, 09 Jan 2023 23:49:05 +0000
Received: by mail-qt1-x82e.google.com with SMTP id a25so2440842qto.10;
        Mon, 09 Jan 2023 15:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rszgv4ftpflSP0hfAbu9auGucePJ+YbSLRVLVyYuDXk=;
        b=bq0pFZG6HYlFRfwv/fEiuOtG+U2H0ZPh+d7TNDidxHUedHGkhXEiMIhrSS73kbvXr0
         9WwhVBJL1CqXfCiMUlUIz22JOdVF5Y8RpGyYnlWqzlN1D5ohpb/b2xycl6ppik2u6x4T
         6Jz3cm4uMHYmAmXHagTUf1ychN2iuHsxPmbsfG7Y2KCjeCirQxaNET9wp6rMhvKcApyJ
         UT1/edkqnYKXg5NNDRn84s6DmgcVAZ7ZOTuuCd94ZXekEy4SKpFL33vNCO1yCHnLW2u0
         NlK49731n7jqJ0BJz+0BJQf9N1L6hNUo/9zU9zY45qcl0jtZbY48Vn8kQoRBDrSHzhQJ
         +sAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rszgv4ftpflSP0hfAbu9auGucePJ+YbSLRVLVyYuDXk=;
        b=2dRPUwM9GxWyIAsa8uFF8uTKOrBRoxBeJrpGiOy0hoh1na1hN10/UWRXL5LMHF8PvX
         Og3xjtEFPNu5uPgqbdUCzTv/h7adASeisN9e+CwCDDgoz7CXQnj9YojQCpmhgBfxWfGe
         90Du31TRP2/jMx50dCX9Py3J5IjXNfvqVulUhXerSIPOEGOdhFG6ynz34DIvpI8pzNzp
         2wcBtO1ithOqzg9FHLY7P+Kebn8GHNZHYQLfywdC8+qKz5NQD1XmWCx27ci4l4z0Hn/J
         LvcXReNxz5ZUMJTwPafGaoICXzlJYX1LbF8pFL9MbWl9JvrBAtDoTno/wKLwuMpTWMwd
         Xr0g==
X-Gm-Message-State: AFqh2krjQGLxC8eiK/5LzC3+yWNWiDGbPd5Brd8zw4F+57TdSH4QACnV
	QcGDWNaylrz+zRBwyMJGuS0=
X-Google-Smtp-Source: AMrXdXsFyUnhOqKpDyFw2zu3D79IHlXWFEnxcd+MLCh7XJ/2VlzDOwjVoHObK/9LFIy/K0bCx6rOwQ==
X-Received: by 2002:ac8:764b:0:b0:3ab:d179:d49e with SMTP id i11-20020ac8764b000000b003abd179d49emr1219580qtr.45.1673308140043;
        Mon, 09 Jan 2023 15:49:00 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id x8-20020ac81208000000b003999d25e772sm5205577qti.71.2023.01.09.15.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 15:48:59 -0800 (PST)
Message-ID: <101995f8-ef11-c3e8-f50f-02aaa62c8e8f@gmail.com>
Date: Mon, 9 Jan 2023 15:48:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH net-next v3 02/11] net: pcs: pcs-xpcs: Use C45 MDIO API
Content-Language: en-US
To: Michael Walle <michael@walle.cc>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20221227-v6-2-rc1-c45-seperation-v3-0-ade1deb438da@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v3-2-ade1deb438da@walle.cc>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221227-v6-2-rc1-c45-seperation-v3-2-ade1deb438da@walle.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_154904_740882_8315AC44 
X-CRM114-Status: UNSURE (   8.58  )
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

On 1/9/23 07:30, Michael Walle wrote:
> From: Andrew Lunn <andrew@lunn.ch>
> 
> Convert the PCS-XPCS driver to make use of the C45 MDIO bus API for
> modify_change().
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Michael Walle <michael@walle.cc>
> Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian


