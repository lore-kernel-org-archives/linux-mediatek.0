Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693C9C76195
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slvp/Lh/A2Cql09K0z7xHRMQAgWLXzuT8obGzP7qfCk=; b=u8upSxCR10uAV7p1Tl9X6Fc8hL
	KUrqgHC+f7V7Lra0KSo5AKFcOIPwp21zAFoJmDoxlQ6JjoybgJIjzVstflgDU40+qVVGgIHWrMMRO
	zs3CuYsiQxc26tu+UtkU2tIgG9XM5w+LAkuTGmYzztrLIfya5NHJv5X1guLmmQUoN7WGhz56wKAH3
	AwwqZX4r0Sc2zRdgmleMO/ltovo7Kd2vv1ygmhcMD9RX2yQqvuNDwITw2AzpPWy7qmK5sVVOumLnR
	SLFDWqBkA0EmwsMOrHe4wuP4+bTVRLiTIEAM4H8Jq5TpX9LFxgvMTdsypP9Vtyg8iLYeOm6iuiXBX
	iH8TqWHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph7Ox-00E7jh-2R;
	Tue, 28 Mar 2023 11:22:07 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph7Ou-00E7gT-1W;
	Tue, 28 Mar 2023 11:22:05 +0000
Received: by mail-wm1-x332.google.com with SMTP id q7-20020a05600c46c700b003ef6e809574so3891515wmo.4;
        Tue, 28 Mar 2023 04:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680002517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=slvp/Lh/A2Cql09K0z7xHRMQAgWLXzuT8obGzP7qfCk=;
        b=KU1v0Fx4pnv1ZCVQH4jp0KoRE4V+rcGx0RcLrPGetxThL36IsY0cdWosFkiDefHuAV
         CqymSSCvpyC4uv8qt2/CLvwSiWoHq12OSLbPUPUx8Iw7Ye2J39PW0szVqxtVVcPMFN0/
         L299LPc34Fdlfqx/Qz2ztzwX/hduA+P7bb9V8Uw+cTYOSGTmKdYPE5mYCWGdSRA9RNqQ
         PNhp8VqQlom8Sk/kPpJTWpLqYRh8joXl5UFkg9ryTcAutGOOCDGzdPJUNJ/15FPTBkXq
         Pj0wm7Ej1ewq0qzrcA2gob4gdTpQGA/g8xLxQWOY2PrpBqidYksWzE8tVPEtBj9cOk4z
         Dvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680002517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slvp/Lh/A2Cql09K0z7xHRMQAgWLXzuT8obGzP7qfCk=;
        b=1xygzDJPQGHDE41U//RXNEN0IN4H9RnKmW5vOj0/dp+hHKwShLAMQ0H/DMfi9q9v2q
         ma2F1wCzrpXH9ISf60YiwAM4zX2mvPbInVHZD6FktWk82BtUOlwO/xRzIIdji+zhFLBZ
         7IgO+IZ8iVgQJn3IDoLfVKz1qRMei9VCdGefwCQrP9sKx6AxAG8JpeEGxnPO/H0aEYDt
         ZEuU4UceP6OjdKRU1sA4QzudvMLB517VV8TCPptGM2iTY1RN8NfDFGV9iJeQWtp+/VQz
         Dw1UeUfDyqawtORQSfk/Stq/n4WSEncZl/K6OsAExRHSu2AcssYxs9F2N8dv/TQ/WuPc
         LMZg==
X-Gm-Message-State: AO0yUKUk7WnQ9IUl2Lfw3KJsSIbE7ONZlQnVXCHetFHhx7W1Qg92pLyf
	Yffflkeg2anGQbpLoJSX8OU=
X-Google-Smtp-Source: AK7set8kjZ2lZPkSladu0ABr5wkk+sKce4J1PUAbHXmMAzrtQEwWAjBFTHklV6EO9Gy91f5+K1M7PQ==
X-Received: by 2002:a05:600c:20d:b0:3ed:6693:138d with SMTP id 13-20020a05600c020d00b003ed6693138dmr11760571wmi.4.1680002517204;
        Tue, 28 Mar 2023 04:21:57 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id w13-20020a1cf60d000000b003ed4f6c6234sm16782604wmc.23.2023.03.28.04.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 04:21:56 -0700 (PDT)
Date: Tue, 28 Mar 2023 14:21:54 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH 0/7] net: dsa: mt7530: fix port 5 phylink, phy muxing,
 and port 6
Message-ID: <20230328112154.qk5fwqaig4sit3ho@skbuf>
References: <20230326140818.246575-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230326140818.246575-1-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_042204_507276_8216B92B 
X-CRM114-Status: GOOD (  14.86  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Mar 26, 2023 at 05:08:11PM +0300, arinc9.unal@gmail.com wrote:
> Hello!
> 
> This patch series is mainly focused on fixing the support for port 5 and
> setting up port 6.
> 
> The only missing piece to properly support port 5 as a CPU port is the
> fixes [0] [1] [2] from Richard.
> 
> Russell, looking forward to your review regarding phylink.
> 
> I have very thoroughly tested the patch series with every possible mode to
> use. I'll let the name of the dtb files speak for themselves.

This patch needs to be resubmitted (potentially as RFC) to the net-next
tree, and the commits readjusted to clarify what are fixes and what is
pure refactoring. With the mentioned that I have not reviewed the entire
series and I will not do that, either.

