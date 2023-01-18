Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B191C38147
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 23:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JG0zmDr4Gx7JTYrA4JUjYF+9TusUlPQwAzE14ZbaLBE=; b=kycE2ov0BOTZK1/Wshe/hcCYwg
	vAozifvT0NX8/wnOg4PLhq2mGdMuOMloT+LkzQv7bYN+59m0erPC42rjlR009Hse4e4+RGewG2XER
	F3aJ73+ORjl0QaXDO5hocgL/ppCS1p/pLdGQH5psnE1Vp6mAdP5DLmO6uHWW4x/oriVApH9kI4rea
	PAAi/3SIZa1YVXxN2KGrZ5X3U91dLBmwdAtL+FbP6pTEqZJsVGt3uhXFTwlqA+QrB5Ksk+cjuso8+
	txEeQsfOqOnuanjPhqBY23VhsUcWRskkxVw/wni/cRPF8ps4e948CqU5oHs38xcwzI7dj0gUp6uQo
	m7rr41mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIHRP-002v3R-Q5; Wed, 18 Jan 2023 23:01:59 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIHRE-002v1U-Le; Wed, 18 Jan 2023 23:01:50 +0000
Received: by mail-ej1-x632.google.com with SMTP id qx13so1115493ejb.13;
        Wed, 18 Jan 2023 15:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JG0zmDr4Gx7JTYrA4JUjYF+9TusUlPQwAzE14ZbaLBE=;
        b=oRqBiOJYIlMdDowmL/wHGABFcI0fDixl2PMB36ctD5uSKk3azFGtf6qd2Fvk85nbjC
         RZGiY6WOS6aL3GADhFTaSpq9sDvNd66O4zvJIfSzbuoiU8TfqAStjiekALks5NkGSaKe
         ovGZ8gH0HmxO9jFlluSL74dBYh1vn5KfO7NSBBuv+DCGaPm6jsuW1hq8QeP+fNTfmlqX
         3IcskUgDBjlFzRib6paxCj+S90vgVnJVBiNY0ccVMPpVBJ9PeZVJOHdXXs+2uIBtQoT/
         vlsHkNs0iO6OaL9F9gRjvD02YML4zxlAojbWSyksCeYa74+TLtrx2SxLVb3arsFe5b7r
         ZhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JG0zmDr4Gx7JTYrA4JUjYF+9TusUlPQwAzE14ZbaLBE=;
        b=VYQONW+MMFKggpXZSkhLOJ7fpgmiYEspqcWnrcV53/Ro89P8v2BMCEq/cM5h4ZgT7a
         OMvTvO7u0H0lQ4Jc7Dov5dgvO2rnG58DnfLazVWwTou/eF97eGwUB8hsY5lLQm6qD7iL
         4r9Itkvifp69iurljVZqJ3KAa4ogbAPti/KUiL6ctQL0Qpj4euatkko/PKyxbB0SnKPO
         LgJcVflRRE6TadPhNYbVoqI6bwDoxKuFxpoNWbnHYVFXfc43ud99YI/tC0Z/mr49BlRZ
         UK7yryFOElqgvfcbR8ha0az1Li5i3/xnj89cz37WICCSmKLlt0FtjcXzJFyOBEgyPKgL
         hk4g==
X-Gm-Message-State: AFqh2kpgvQilcN7cSdi7f8VjMe+lEQHjA+uPHFNFD8LkYyKF0rOkjKLx
	v8ZvuT8sKbR4BhdT3o+IEVg=
X-Google-Smtp-Source: AMrXdXuoqpi45+sG2pftBtwBbFskPfB44UC+cRcWbZWXXc+n+Hirrb16NdbKE6aaVF+8KoKPwtvNJQ==
X-Received: by 2002:a17:907:1019:b0:84c:69f8:2ec2 with SMTP id ox25-20020a170907101900b0084c69f82ec2mr8598505ejb.22.1674082899134;
        Wed, 18 Jan 2023 15:01:39 -0800 (PST)
Received: from skbuf ([188.27.185.42])
        by smtp.gmail.com with ESMTPSA id k11-20020a1709062a4b00b0073022b796a7sm15579629eje.93.2023.01.18.15.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 15:01:38 -0800 (PST)
Date: Thu, 19 Jan 2023 01:01:35 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: netdev@kapio-technology.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
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
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>,
	"moderated list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>
Subject: Re: [RFC PATCH net-next 2/5] net: dsa: propagate flags down towards
 drivers
Message-ID: <20230118230135.szu6a7kvt2mjb3i5@skbuf>
References: <20230117185714.3058453-1-netdev@kapio-technology.com>
 <20230117185714.3058453-3-netdev@kapio-technology.com>
 <20230117231750.r5jr4hwvpadgopmf@skbuf>
 <e4acb7edb300d41a9459890133b928b4@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4acb7edb300d41a9459890133b928b4@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_150148_748058_601E2D52 
X-CRM114-Status: GOOD (  18.09  )
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

On Wed, Jan 18, 2023 at 11:35:08PM +0100, netdev@kapio-technology.com wrote:
> I am not sure I understand you entirely.
> From my standpoint I see it as so: that until now any fdb entry coming to
> port_fdb_add() (or port_fdb_del()) are seen as static entries. And this
> changes nothing with respect to those static entries as how drivers handle
> them.

This is true; it is implicit that the port_fdb_add() and port_fdb_del()
DSA methods request switches to operate on static FDB entries (in hardware).

> When the new dynamic flag is true, all drivers will ignore it in patch #3,
> so basically nothing will change by that.

This is not true, because it assumes that DSA never called port_fdb_add()
up until now for bridge FDB entries with the BR_FDB_STATIC flag unset,
which is incorrect (it did).

So what will change is that drivers which used to react to those bridge
FDB entries will stop doing so.

> Then in patch #5 the dynamic flag is handled by the mv88e6xxx driver.
> 
> I don't know the assisted_learning_on_cpu_port feature you mention, but
> there has still not been anything but static entries going towards
> port_fdb_add() yet...

For starters, you can read the commit message of the patch that
introduced it, which is d5f19486cee7 ("net: dsa: listen for
SWITCHDEV_{FDB,DEL}_ADD_TO_DEVICE on foreign bridge neighbors").

