Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AB4C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 19:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THXcfT1gL+QhHkNxKHFXSnGLhR291IgK2JOIaE2Z6qo=; b=y7VLiehXQhG0nBBysYb5wH0dkd
	6FVrGrXekhK5nkjrKXrIW1S4t0CcDLyW0mU5CKcGUeoIg4jHfPXbK5Aw+VY8PBRLKDr8VaMT21Rzd
	PnggGI4Mw9RlpEL8KlCkd/k12EQ3BLDcH93DnvNdpBmQI/Rbnj2mbbvt75bASBQf+MBsBekmG8FYJ
	ista4hF2+AcbravbQa8wmQxk8SqBppQADdVk/J/nSrTNkBZEd0oD/AaiZC9HbkNVujs8wtERNy85A
	CY78Ul2rEhnv2MkNkPefEXIqSdx43n8l5hA9y12SDy9FXxfOOiP6KatdEiv/9LM/rf0RBBfF2Du//
	33nMPcsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phxvx-004vEP-0x;
	Thu, 30 Mar 2023 19:27:41 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phxvs-004vCT-2F;
	Thu, 30 Mar 2023 19:27:38 +0000
Received: by mail-pf1-x42b.google.com with SMTP id q20so2158477pfs.2;
        Thu, 30 Mar 2023 12:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680204455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=THXcfT1gL+QhHkNxKHFXSnGLhR291IgK2JOIaE2Z6qo=;
        b=WmGqWWMzTa4UZZyZupqoOaK6GO0R0gyuPF1w/NqQwOR3PF78xzpkBDkvwwgDoKpLe/
         TO8kQ7yjlIBI/KZP17rpKiGl91hhAscGFQWH8bwfzCwzF7hgA/t1yf2YQ/fuHiOp/Y4S
         m7R0idI3KheKtG2pQCctaTWNZDNuq+HWnorSSdiqG/ymH92rpMLkcGFTOyTtxfcqdxFI
         +HSWS3FP+TZoKgHMkZWokuQpZ/GTLBA5F8DvRGoeZUmx6bxve4cZDoFXog93Ecc/69uL
         FX3PpBeZ/ZID2bZIVnqkah/3XdryzZGiTLyPvI6m/Fr5UTO00wLm0O169i2aocSTk7oI
         jxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680204455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THXcfT1gL+QhHkNxKHFXSnGLhR291IgK2JOIaE2Z6qo=;
        b=Gy5Wk1h6AdOOfruYbLlqBiQC7t9ZQFmCSX8dzf2uJYR2SdHpucp3EjbzlfoQooS7BP
         CZ9r4uyiXnGISLkWHj5eqlCUp72H4p0BGNlUQKw3pj4431Tr/Lc8+0j4kImvVF8e7NFf
         VMZ7bWgikJx9PaslXjlrOezYH5v8IN94glCtteLYlsMYHX6E06BAJdibkrhN5mAB+dMj
         DXvwnHGXhEEwFhUA3AWSJ9D9HBKXUx7CMTGTSibTD8v5WCekKk089cnjc5xNTEaHenpk
         L0ROS/X5drkTTyu+tey1CJmJXUXoYeOKMY7guLIzXv/zwUXC9OBuYoLdU11OeEfzVD6K
         OuZQ==
X-Gm-Message-State: AAQBX9eHECtZpq+YYuFhTiVU67S7q7x8DDW6a3pJaw234UYS65yqNUA4
	qXiod+M+aWOHaeP0HB3hho8=
X-Google-Smtp-Source: AKy350ZPHYj9WRFwCpKfZ1lGfBi7hLQFoLXN09dTmyyi2iU20kDBjCxBeGVka6HE068VChtsu0Cg8g==
X-Received: by 2002:aa7:96b0:0:b0:626:24b2:cd6c with SMTP id g16-20020aa796b0000000b0062624b2cd6cmr25705666pfk.7.1680204455073;
        Thu, 30 Mar 2023 12:27:35 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id j6-20020a62b606000000b0062d7fa4b618sm225784pff.175.2023.03.30.12.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 12:27:34 -0700 (PDT)
Date: Thu, 30 Mar 2023 22:27:14 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Hans Schultz <netdev@kapio-technology.com>
Cc: Ido Schimmel <idosch@nvidia.com>, davem@davemloft.net, kuba@kernel.org,
	netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER" <UNGLinuxDriver@microchip.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>,
	"moderated list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 net-next 6/6] selftests: forwarding: add dynamic FDB
 test
Message-ID: <20230330192714.oqosvifrftirshej@skbuf>
References: <20230318141010.513424-1-netdev@kapio-technology.com>
 <20230318141010.513424-7-netdev@kapio-technology.com>
 <ZBgdAo8mxwnl+pEE@shredder>
 <87a5zzh65p.fsf@kapio-technology.com>
 <ZCMYbRqd+qZaiHfu@shredder>
 <874jq22h2u.fsf@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874jq22h2u.fsf@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_122736_740123_8A933E64 
X-CRM114-Status: GOOD (  17.41  )
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

On Thu, Mar 30, 2023 at 09:07:53PM +0200, Hans Schultz wrote:
> Not true, it reveals that I forgot to put it in the patch, that's all. As
> I cannot run several of these tests because of memory constraints I link
> the file to a copy in a rw area where I modify the list and just run one
> of the subtests at a time. If I try to run the whole it always fails
> after a couple of sub-tests with an error.
> 
> It seems to me that these scripts are quite memory consuming as they
> accumulate memory consuption in relation to what is loaded along the
> way. A major problem with my system.

I'm sorry for perhaps asking something entirely obvious, but have you tried:

kernel-dir $ rsync -avr tools/testing/selftests/ root@$board:selftests/
board $ cd selftests/drivers/net/dsa/
board $ ./bridge_locked_port.sh lan0 lan1 lan2 lan3

?

This is how I always run them, and it worked fine with both Debian
(where it's easy to add missing packages to the rootfs) or with a more
embedded-oriented Buildroot.

