Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5A6CC6B13
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 07:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32p4bkVSjbVJjkHnuQaeCCBADq6jSYClg9R5pRBhYMw=; b=l7qTKtEBzCaRfRjDQgxe3lZzEo
	anUK3Q3h3r5X1HdMpI1IaYFGTnqcto0Q22QGCUFp4gY6g6+1eRCHgCHj8S9SzsvtoKfh8czw+wMyd
	G0tPtUiWKnCQyqyn4NVuJ0U8TfOLFfrXPbjdZ7OPPHlHIoXd+ai0mqUMD2bsZmuOMiYJCOloR4azz
	mr1DqNg7MDHhSJ3YvmegrOVdXDmShDeFx62M6CxCfPq5N4UUddXXCjxn4fOxGs0d1HWA86ZsUqemv
	zOcjryOuh8NIHs+AcatHhMmebtuSGadt/JmL+CbN05uRhDPu8GT2vwxy2j9Wr9rG03fw0HgJNyCWR
	rDsg9gWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXK4-0000000CGQP-1Tmg;
	Tue, 13 Oct 2026 07:53:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXK3-0000000CGPp-11XN
	for linux-mediatek@bombadil.infradead.org;
	Tue, 13 Oct 2026 07:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=32p4bkVSjbVJjkHnuQaeCCBADq6jSYClg9R5pRBhYMw=; b=mV2/DVG7BZXUnTsxkjhZ2IAaAi
	EOzpQhHzMI1iQOLiLBa0xzKPCWk7PbRczIvpltmQTUiE9IFurqsBwQeUHAZz5CsZ8aoBSGNQgJ9/W
	UvgyaeU+ShvsaDWwYE8iQA5AYREp6QXQrP+pMXmUUiseaHCD2Tnhupxd/da/logqHbml2/+J5b2Bg
	TiDxYs/WxZdSZFKH1zgPO5E42OAKj+Y3QEgLSaTyMHdVhZyvxrEMRmBKqKiWbBsdGZufik+fsC2Za
	eIzx2CzkGFoF15JYhmyr9ZjaEZga3Mj8iEPJJX55w2A5dc6mgtbJNi5xU4xBXZoTMXg+Nv+AgZX/p
	Gt5sD6tg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGXJu-0000000FDmi-3PsO
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 07:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791877986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=32p4bkVSjbVJjkHnuQaeCCBADq6jSYClg9R5pRBhYMw=;
	b=Fvs35mysfYwuDmTMUHEO8mn8S0bzgQI94rnY2T9obqeABIU4UleRIbOZZtk33X25MD9e/s
	AbiAyI4AmlNh0lVbT3VKPhm76CVwTJhsIM9zgrSj9jBjLEM+3zwHjT6uhV7SN4v9EnlyPI
	lUHNNJ1rmPUezCD99AY26JOi6tJDF9g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791877986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=32p4bkVSjbVJjkHnuQaeCCBADq6jSYClg9R5pRBhYMw=;
	b=Fvs35mysfYwuDmTMUHEO8mn8S0bzgQI94rnY2T9obqeABIU4UleRIbOZZtk33X25MD9e/s
	AbiAyI4AmlNh0lVbT3VKPhm76CVwTJhsIM9zgrSj9jBjLEM+3zwHjT6uhV7SN4v9EnlyPI
	lUHNNJ1rmPUezCD99AY26JOi6tJDF9g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791877986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=32p4bkVSjbVJjkHnuQaeCCBADq6jSYClg9R5pRBhYMw=;
	b=Fvs35mysfYwuDmTMUHEO8mn8S0bzgQI94rnY2T9obqeABIU4UleRIbOZZtk33X25MD9e/s
	AbiAyI4AmlNh0lVbT3VKPhm76CVwTJhsIM9zgrSj9jBjLEM+3zwHjT6uhV7SN4v9EnlyPI
	lUHNNJ1rmPUezCD99AY26JOi6tJDF9g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-7pPeWKZEMrOSaNZbA52AwQ-1; Tue, 13 Oct 2026 07:53:05 +0000
X-MC-Unique: 7pPeWKZEMrOSaNZbA52AwQ-1
X-Mimecast-MFC-AGG-ID: 7pPeWKZEMrOSaNZbA52AwQ_1791877984
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48aef5cfe43so1558053f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 00:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877984; x=1792482784;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32p4bkVSjbVJjkHnuQaeCCBADq6jSYClg9R5pRBhYMw=;
        b=eNjQoakO5ilgiO2RDkUXuDsL+A+PfcE+Zxi5PyxC145mQoM3Lf8+q8VO91Ge4q4A/e
         cAasjY0TdCh8D+b6h9vYko4CPJAByh0lXPQFooYG3FDq07SFlGLG1jfKCr3Ow7VhMM0k
         PUvl7cR+9efUZJO3PMn6YOQE5NvbWtwFdckqHEM1aJhaiodXVlyDvWHPv7VDKX7v5Za3
         3vOoANiPiqZOYsj/h7Voa92Rsi32164Ex9Q0y2sl7ErUd6qS3hBttYhIsCuBSZmi5MlP
         xmlmK9SmGxJTcZW9XK5gm38jfw0SGNAoXZ43Ds3QfuD37iYxxUkBuzHuOHjPvoI0+xR4
         xVKA==
X-Forwarded-Encrypted: i=1; AKwUvBwW1shPd7XxK50ZLuskYbH4uRPIXHhcGRtDeSCbATZK428+cKkzdKxCj0XSQ5IbOOINGVDgDvspiFCpmJ+GNg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIY4kJ3RNFpu/r7Ql+Pqd8T+U/9+EQ/C5PJb9d+k8Cf6IKcQFkv
	DO4OhxCm0RER1wxwlOeHrgXsYJB9yHpCLUfIhYFUe4/cV1il2B2SArxnJnGE4+XQYk1PJdKm103
	dwz+2zBlvaVa/yOnZ0NxJVh1klkUYxdW5SZjT/2QsTIaBHrCcI+l+OVap4VT44qTVEZkrLq/0Sy
	yF5bCE8g==
X-Gm-Gg: AYBFou0y8TDpNrPWc46IA0hp1UhoH2NliKzxHpBc9PGI9D+2MJYSn95PChCxgrjSAwy
	yCCQCcRohXlFP4i0q7m7OuYnNjyIkynZ3aN2T83Dr3VIhwXE5w3cyBB92LsphzttI0pEuixrkLf
	4/IQjqYXXvB0xo/rJXuK4LT73UDjrBi78YmMT5L1ahnjV2Sk2824uXwQwEeBKDMSKqr5ef6n5CY
	QKYuR7pkt/r+nbU9MSf3pZbmolRjxRZQtBGQtBGGWW7/RJ2/6kBXo4VRX1LhXCxajQuPmJj76SB
	F4luYsNTkl9NBvpgJqKSFT1Kh5RWw24CMxbePFfR7Xa0BGeY33kHzNNx8NpHXlHn6zEJNMYKFfW
	FfY4CMAl3WQZ7V4qZtwF7oSTSL45mF3qAbXe//zKr3qQEtldc/RMNTOij/4md1+ZY4Six2XLzJw
	==
X-Received: by 2002:a05:600c:19ca:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4a18e4ac650mr226794265e9.14.1791877983796;
        Tue, 13 Oct 2026 00:53:03 -0700 (PDT)
X-Received: by 2002:a05:600c:19ca:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4a18e4ac650mr226793815e9.14.1791877983291;
        Tue, 13 Oct 2026 00:53:03 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm377412975e9.10.2026.10.13.00.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 00:53:02 -0700 (PDT)
Message-ID: <aa01ab1c-da2c-4638-816b-f535b635379b@redhat.com>
Date: Tue, 13 Oct 2026 09:53:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 0/3] net: phylink: wait for a PHY that probes
 after the MAC
To: Aleksei Sviridkin <f@lex.la>, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20261006124731.1528963-1-f@lex.la>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261006124731.1528963-1-f@lex.la>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YEYgrvHYaGz49dULAAjuk-p2w3BmPgo2U2aEPRS6jFU_1791877984
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_085314_239623_8F1EB8E3 
X-CRM114-Status: GOOD (  22.73  )
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

On 10/6/26 14:47, Aleksei Sviridkin wrote:
> On the Keenetic KN-1012 (MT7981B with an MT7531 switch), the Airoha
> EN8811H behind lan4 has its PHY driver built as a module on the root
> filesystem. The switch sets up its ports before that filesystem is
> mounted, so the port is validated against the generic driver, fails its
> phy-mode and stays dead for the uptime. DSA does not retry it.
> 
> Patch 1 lets the PHY node say so with needs-host-firmware. Patch 2 makes
> phylink poll for such a PHY instead of giving up, for a MAC that opts
> in. Patch 3 opts in DSA user ports of switch drivers that set a flag,
> and sets it in mt7530.
> 
> The poller can still lose a race against an unbind of the PHY driver,
> between its readiness check and the attach. That window is phylib's:
> any phy_attach_direct() caller racing an unbind has it. The attach
> guard series [1] closes it.
> 
> Tested on that board with the series backported to its OpenWrt 6.18
> kernel, together with a940003f44e7 and 07d995873960 (the mt7530
> .get_stats64 atomic-context fix). The kernel had lockdep and
> DEBUG_ATOMIC_SLEEP on. Local debug parameters, not part of the series,
> drove the error paths. They fail the connect after a successful attach,
> ignore the opt-in, fail the generic attach of a PHY with no driver, and
> add a sleep after the switch shutdown.
> 
>   - boot: the PHY driver loaded its firmware at 8.7 s. lan4 attached at
>     26.3 s, when the port was brought up. Link up at 1 Gb/s.
>   - port kept down for 10 s with the PHY driver bound: no poll and no
>     attach. "ip link set lan4 up" attached it a second later.
>   - opt-in ignored: the old behaviour, the generic driver took the PHY.
>   - two injected failures: "failed to connect late PHY: -EIO" twice, a
>     second apart, and the third attempt attached. Link up at 1 Gb/s.
>   - failures that do not stop: four attempts and one "giving up". No
>     poll after that, also not after a down/up.
>   - four failed generic attaches with no driver bound: nothing logged as
>     a failure and no retry spent. The port attached once the driver
>     bound.
>   - switch unbound while the poller waited: nothing oopsed.
>   - reboot with a 3 s sleep after the switch shutdown: the poll ran
>     every second up to the shutdown and not once in the sleep. On v5 the
>     same test polled 3 times in the sleep.
> 
> No in-tree device tree sets needs-host-firmware yet. The board is
> supported out of tree, in OpenWrt.
I'm sorry to give this feedback this late, but AI flood forces this
workflow on us.

The above looks like a significant amount of complexity for OoT driver,
and I understand it could be solved with a different kconf?

/P


