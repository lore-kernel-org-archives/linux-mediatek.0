Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFC3D15D98
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 14:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0PguM/y3AdR81087UZxaCc/iTHakbzKnJWRYI0kM+s=; b=2okRDZ7UiXnopVsEPyaZvVq27y
	VmrYaLhmYAiwmXUKyDn+71cTcmiCWfAlwetjpEse13Jye43m6PmEAvhKxnTxW9BCl40B7M9bMF9XY
	tCGwEaqBPQJaBc9EwUrRCfB70j5XGwFdo61+RmCRzXdftnHLEHkTXewe8U39vg8dBmXqKpRXbyRNY
	ndoe7Yb/qvfHPJloxgC6sg8B/3+lP76rIdIjg07ChnzB7g8MaYEwpprO2wpV1VwVyHhxf07NadlV2
	OfSlFuwx+xbG3SStdTO99N2eFLd9OMpKtGlchS405LCu66K7Q+tzMxBtwo+q3zlvjK9VE+gdQnFNK
	9KeBuCJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2tBw-00000007aLt-0Ilq;
	Mon, 21 Oct 2024 14:15:28 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sku-00000007U8m-1inC;
	Mon, 21 Oct 2024 13:47:34 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a99e690a3e9so48363966b.3;
        Mon, 21 Oct 2024 06:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729518450; x=1730123250; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L0PguM/y3AdR81087UZxaCc/iTHakbzKnJWRYI0kM+s=;
        b=khv4L5RPBozNpiAffY8eBz0e9rGPpF+ikqDcvt1c/nwowJavtbjHL17Zj8C3Bfh8Ja
         LbVbcHD+CEP1P/AcevDly9dx9ZUP6cVgTTZFMUaW3mZmVqAvX8VuhQyap/ndrRA0338R
         S4JlCwIGtoeON4PKLCL4+sURgssl9d5zOEHBf0jyyEiMMQz7SNGX/JC/f5J8ADgB2mfs
         e2uerhqWz+oGwrfv+OYd4kiRjLb3oRgWAcJLmnLdtgOTtN/gD/FGeR7XLiTloGfb2VmG
         KKH59khRoSYd2exnIO9GMEJU7yKHACLH9pfCjm0cF+K20htXHGteQk6GVJov2XJqCVBE
         o4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729518450; x=1730123250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0PguM/y3AdR81087UZxaCc/iTHakbzKnJWRYI0kM+s=;
        b=E5datjEyuZr8F0LaVpe/FI5h4jIBD6Qbuod1DQ+XcBC17VJ1jHZr1qEwBENp+bZ2nf
         7Us73tTlZcSDTJv4Lip5KFKjeSYXAZXZBzt9+6tv/w4Wry7wxc8Hmb/3rFNJkaFo1nma
         IIq++LydKVeyoxvJYF5ya8dI33PvolVtHvQTfJnK+8lT007qHDYdwAvKSRMLzBaRNoEk
         TK2tu2V66+vZLBwj1InV8vU9UTrerNJb9g3iSijiRjr5O8/WhxCinuc+n3CG7PiRT4aX
         ltFn+LYnnGdizRH6FoIKpn4CNslKo6/vQHAOOtehIZNzTQI074L6hVozx7FZVYotVU5H
         s7bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSPNwq3aP1mgZMWdpcsyXbQT9WSKH0QvrgshFUOKBq7FNyp297ANgUvjVWEcVDf0zF5aX3fQmwRE9/MP1H+bGv@lists.infradead.org, AJvYcCXxOEXEAyt32LPsEdojRPJxndIo26QH5z7fE3RHte/MqrwpfaCDXI4Q2aiY4hVFCstkrclmxQgfiTOEQClTQ2U=@lists.infradead.org
X-Gm-Message-State: AOJu0YwqfrR+P+z+tRM4RliFzLnClcH0YfWG3azfSWGHdkLV7VWqO7tU
	soey/SkYuirN+Jr3wx3g+WyHVEXbAfCT22nWAkmyZ86LZ9NP1XSo
X-Google-Smtp-Source: AGHT+IHllwIsaig8SX4FhN+AvinTZ5nJRChFYQ0yBVkHaCSnwF1lUgDNNoWUZkrrdij66hbn5eP8Xg==
X-Received: by 2002:a17:906:6a26:b0:a9a:5b78:cee5 with SMTP id a640c23a62f3a-a9a69c685d4mr437986966b.9.1729518449909;
        Mon, 21 Oct 2024 06:47:29 -0700 (PDT)
Received: from skbuf ([188.25.134.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91370e54sm204503966b.102.2024.10.21.06.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 06:47:29 -0700 (PDT)
Date: Mon, 21 Oct 2024 16:47:26 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Eric Woudstra <ericwouds@gmail.com>
Subject: Re: [PATCH RFC v1 net-next 11/12] bridge:
 br_vlan_fill_forward_path_mode no _UNTAG_HW for dsa
Message-ID: <20241021134726.dzfz5uu2peyin3kk@skbuf>
References: <20241013185509.4430-1-ericwouds@gmail.com>
 <20241013185509.4430-12-ericwouds@gmail.com>
 <281cce27-c832-41c8-87d0-fbac05b8e802@blackwall.org>
 <6209405e-7100-43f9-b415-3be8fbcc6352@blackwall.org>
 <20241014144613.mkc62dvfzp3vr7rj@skbuf>
 <b919a6b1-1c07-4fc9-b3dc-a7ac2f3645bf@gmail.com>
 <785f6b7a-1de1-46fe-aa6f-9b20feee5973@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <785f6b7a-1de1-46fe-aa6f-9b20feee5973@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_064732_512177_42DE8BE7 
X-CRM114-Status: GOOD (  24.86  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Nikolay Aleksandrov <razor@blackwall.org>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Pablo Neira Ayuso <pablo@netfilter.org>, Jiri Pirko <jiri@resnulli.us>, bridge@lists.linux.dev, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Oct 20, 2024 at 11:23:18AM +0200, Eric Woudstra wrote:
> So after doing some more reading, at creation of the code using
> BR_VLFLAG_ADDED_BY_SWITCHDEV would have been without problems.
> 
> After the switchdev was altered so that objects from foreign devices can
> be added, it is problematic in br_vlan_fill_forward_path_mode(). I have
> tested and indeed any foreign device does have this problem.
> 
> So we need a way to distinguish in br_vlan_fill_forward_path_mode()
> whether or not we are dealing with a (dsa) foreign device on the switchdev.
> 
> I have come up with something, but this is most likely to crude to be
> accepted, but for the sake of 'rfc' discussing it may lead to a proper
> solution. So what does work is the following patch, so that
> netif_has_dsa_foreign_vlan() can be used inside
> br_vlan_fill_forward_path_mode().
> 
> Any suggestions on how this could be implemented properly would be
> greatly appreciated.

I don't know nearly enough about the netfilter flowtable to even
understand exactly the problem you're describing and are trying to solve.
I've started to read up on things, but plenty of concepts are new and
I'm mixing this with plenty of other activities. If you could share some
commands to build a test setup so I could form my own independent
opinion of what is going on, it would be great as it would speed up that
process.

With respect to the patch you've posted, it doesn't look exactly great.
One would need to make a thorough analysis of the bridge's use of
BR_VLFLAG_ADDED_BY_SWITCHDEV, of whether it still makes sense in today's
world where br_switchdev_vlan_replay() is a thing (a VLAN that used to
not be "added by switchdev" can become "added by switchdev" after a
replay, but this flag will remain incorrectly unset), of whether VLANs on
foreign DSA interfaces should even have this flag set, and on whether
your flowtable forwarding path patches are conceptually using it correctly.
There's a lot to think about, and if somebody doesn't have the big picture,
I'm worried that a wrong decision will be taken.

