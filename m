Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4169CC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 20:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYdHJswDeDT3txuf8JK/w+986tI61N01JzHQOoC+jnU=; b=cDk/IklFwTbZinND4fGTlFvaRO
	KkTaXOCjBmsn0OT4zU6DJV16SgUdA1ZJG9ybRkoxOoFg8i31Ibu+ZTEhIs2931JwVekp7UbUGgLbL
	aFshT/qyFKhxgAjH+NeXqVGixO7z2MbH41LSyMuqpaAqHWuqtcHF3Q/27P64yRhlxjepwRVrlXSXq
	Y7E337vVDt8q2+oGaDPHsHU/Vtxfs68Kbh087I8nOyuw8KQq60IQAEJyjFmLYx/IpOHm5fauIm3Hf
	FjQwP/WbZTucBMfEq0qAVyKDSy752iBVxpDzeXzFwR9Z7VWDE78CShWU5avuGfdewhNHzE0lO3AgL
	zbZLA7pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os8vM-000LNt-N4; Mon, 07 Nov 2022 20:40:52 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os8vC-000LJS-2E; Mon, 07 Nov 2022 20:40:43 +0000
Received: by mail-ej1-x629.google.com with SMTP id k2so33408044ejr.2;
        Mon, 07 Nov 2022 12:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYdHJswDeDT3txuf8JK/w+986tI61N01JzHQOoC+jnU=;
        b=Q+Ezft1Ugxx7pFfrT+/0zleWdM2c1oPP+CSzpxbWAF61TwxLeiwnKzbfP996DLBRe0
         RWTV+nn9uSwH/juyDPDPdxgnnstdQ4uFjcGFK3GlHQiUm+7E7JhUvbbzUOcfcZW8G34D
         IlQzk235D2Z6WlmavUqa+sxbA4+yhdJ9+xVBdKYlvXLWpeMauv+gg1GLUml5t8jgMe68
         55E2E+pt4lQNL43f/XQx605AqWcPvfFfPS9dFEJIAtUv/TzZ6QvIN2No8tKWx6Hh6UDi
         5MSOCw8D8sAu8W570HmZU7qgcOFUVrtE8G7LWVcPwBdp7Tr0tqLaw15O5LlBOp87iyXY
         UP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYdHJswDeDT3txuf8JK/w+986tI61N01JzHQOoC+jnU=;
        b=APfY3Raae1aeCPZUkhSl5CoCHTy0Jdv1XMkgGa+TmPAPnaqU53LT20JJIs+k6k724I
         M7DKW6fbZxs3NAunsIKjhpe8OyL9bzcsWK01kmUqwH0ZezeUEQNdpzp/bgiRcmah9VtL
         T677+PNH6YNFAkL/5JiVbGKTYEpMGSkxVMSbmAB2SHwyIkrn8TaYYa6mVwg54ySprf9W
         mK+lkwT311lqusficyiTZbrMQSQOjH0m4LfeY5fy1kWaEoYl4RWkWmtxvJWcWp8NUCk7
         gbj8peo5tDlvRWsQKTvgixAYqkC4Zikzjs72F9S56PE8F8STPLlLejd73KEwp2KHxNpx
         sBGQ==
X-Gm-Message-State: ACrzQf0xoRHGSHWbkZEd4gm1SE+or8gFwFP7FYgToQnykz0KHQX9Q5/D
	EWrenWsi27PMjl2S8CuiWVo=
X-Google-Smtp-Source: AMsMyM7OX51d9S1r13lEiI4F7DiaNTNLGHVFhzmJa4PWwH5gjRXGrlYR+119nzng5vyUZSAFHDPSTw==
X-Received: by 2002:a17:906:5a5b:b0:7a6:cbc7:4ca1 with SMTP id my27-20020a1709065a5b00b007a6cbc74ca1mr49681321ejc.544.1667853636915;
        Mon, 07 Nov 2022 12:40:36 -0800 (PST)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id s14-20020a170906960e00b007803083a36asm3868053ejx.115.2022.11.07.12.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 12:40:36 -0800 (PST)
Date: Mon, 7 Nov 2022 22:40:34 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/14] net: dsa: tag_mtk: assign per-port queues
Message-ID: <20221107204034.bwbhyhahku4m2xdd@skbuf>
References: <20221107185452.90711-1-nbd@nbd.name>
 <20221107185452.90711-5-nbd@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107185452.90711-5-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_124042_168050_4293F027 
X-CRM114-Status: UNSURE (   9.23  )
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

Hi Felix,

On Mon, Nov 07, 2022 at 07:54:43PM +0100, Felix Fietkau wrote:
> Keeps traffic sent to the switch within link speed limits
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---

Do you have a patch 00/14 that explains what you're up to? I'm only
copied on 05/14 and 10/14, hard to get an idea.

