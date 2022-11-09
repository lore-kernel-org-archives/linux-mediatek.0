Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85492C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 23:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFt2iInFdLzf7GfwKHdD3j+aUdF9jsCsydxz9v2UQ1A=; b=d6e5pRhag22PZVAfTPmHTX7fQE
	iEMdArjRUHCbTLKkcNfi0SG/o+SC2YiJdFV/gHlQ0P0N+y59aWBrYjrLy+iA7KOg5iX0FshtcvwEj
	XFwMRkZ7sjZngHKOYIUMMzV1ikTuJYCST0BP/dLP0SoI3HqqGSMwO8rkuBeHGTNGheMQAgDHv7N6T
	oBOi3X9S5Zz5BkpKHwE6CnuCmsXh2usV9wXdRYXbp/R0il4O+qiF+S5mYh4LixXRX3ri7th7E3uND
	BUkUuGkBHcsuDwRErPmoJzE25XhqKVITQ7blJbPwxA1rzTUMnEKqsgHCaLXsM3SuD1F3hV9e0Cwuh
	vPbKu2gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osujQ-000qxT-0m; Wed, 09 Nov 2022 23:43:44 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osujN-000quQ-EI; Wed, 09 Nov 2022 23:43:42 +0000
Received: by mail-wm1-x32d.google.com with SMTP id r203-20020a1c44d4000000b003cfa97c05cdso571616wma.4;
        Wed, 09 Nov 2022 15:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OFt2iInFdLzf7GfwKHdD3j+aUdF9jsCsydxz9v2UQ1A=;
        b=kYEiR5/XOnWEJcuYQMT/lDt/q8F2QByKoxnBIy8kZjgohSvQyo0mUtanQgf3+szIvN
         MSOVRCegCpQf51QSynEnBwEnWtNVgeWke+9m74gQDRNLOwx8GSh9kF2VvTh07UtAyeb+
         tHytmoLhDRJpJzaYFDE72YRZKtE9IdNDwOlN6rG6bu0dkd9DBpkTm2vFQVWZDZrPxtDH
         tGyyJeySMdSgqKFslJQXsRmVIbR26tBqoBEdsYUEsjx+vwoa6R2jLXMWXhSREnez3NmD
         GPxrfdpRIgqKjbZ98FAYSpXRJcPhzA2UBZWktFLXLHj8Va++t3WQwNv6SbFdTK1Ms7J4
         9Ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFt2iInFdLzf7GfwKHdD3j+aUdF9jsCsydxz9v2UQ1A=;
        b=ZK/dDUqsaS6oWnL+pTMhZYpSr540bUz/CL6c+ByT7SnnHxyOix6tkSJdfoSopK+zaP
         MNS71Pm5929QdrnYDm3qcQS6/T0JX6Sypa5qhrhzkarcs1eG3Aw+qQNFc4SlYbXUUJDc
         OPabwKLJosamFjbw734wwEZ5gGaC3UgDLh0NEzMqt6ihNRGrVOATqs0NohQvBSU6HGd/
         rs0pPpw7Te/3BYkYrHFKXDNHBXtQF3Yr0O92wYme8bNb0G6kKCXp03K/oKjwZZxlz3O3
         WACSdc1PtYfriSHAYgmScWUfAw1f5uJtWhVT6uO8e/kDFn1U4aUyvGH1vfGYcyes4w6E
         3Img==
X-Gm-Message-State: ACrzQf3uyp4/9eT8FOzhS1jyWQ18YD1t+mNV4Pol5A5S+0y8tih1y7VM
	bKROU5Y26y4Ak852tMpC/dA=
X-Google-Smtp-Source: AMsMyM5mQGFSLzsRyD3kfuv9grfSRmnWBY0njMWzcYer+2VdrbkUGshrhvuuBCy7VXGZRtVzf0QNAA==
X-Received: by 2002:a7b:c3c4:0:b0:3c4:785a:36d7 with SMTP id t4-20020a7bc3c4000000b003c4785a36d7mr52661181wmj.138.1668037419391;
        Wed, 09 Nov 2022 15:43:39 -0800 (PST)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id b9-20020a05600003c900b0022e6178bd84sm14494051wrg.8.2022.11.09.15.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 15:43:39 -0800 (PST)
Date: Thu, 10 Nov 2022 01:43:36 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Colin Foster <colin.foster@in-advantage.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	=?utf-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 net-next 5/6] dt-bindings: net: add generic
 ethernet-switch-port binding
Message-ID: <20221109234336.s4womtunv3i62agk@skbuf>
References: <20221104045204.746124-1-colin.foster@in-advantage.com>
 <20221104045204.746124-6-colin.foster@in-advantage.com>
 <20221104185028.GB2133300-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104185028.GB2133300-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_154341_518369_B4E9FF06 
X-CRM114-Status: UNSURE (   9.03  )
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

On Fri, Nov 04, 2022 at 01:50:28PM -0500, Rob Herring wrote:
> Or we can just allow anything from ethernet-controller.yaml and drop 
> this list.

Sounds fine to me. Makes ethernet-switch-port just an ethernet-controller
where "reg" has a particular meaning (port number). Which is basically true.

