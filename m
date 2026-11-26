Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A86A606A31C
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 08:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PJI9bsZP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YabsYvNcN7NRudE3X2qygK4jhCTbAWijGXAt+Ry/b3g=; b=PJI9bsZPVUkkae
	B4m4p698i95OAn/3Pq+CWCOloWD275W6I1QFs2XMB2jhEfTMRAjuuBebu2zgDNY26eUitz2XWY6Vd
	Imb7HPLXQx5LR3B0uWg3gLV4teXZN+wHs9C4vso9JXIXZVK4vAUpeMG2vEPqf3B1Io6XFFyT0S14C
	vMG1IBxNGuRwrNBJ++SA+RtYGgN+ptxlByDbfN00yT9apSXZX23wYZbcVgZGQ9iFWktmkR01Noncn
	uUYsZ//FR6A7F4JccSH/U7YpmDX7VP82pHtSxhCyZ0EMLSAq3mfUHt9iH3zan4Uq1zqhUdaXzLvi+
	sXNg/rKIvjwyhmiP/jCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVJf-0000000CT23-3eLO;
	Thu, 26 Nov 2026 08:58:55 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVJd-0000000CT1O-2yd2
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 08:58:55 +0000
Received: from [2a04:4540:1403:56fc:14c:5747:737e:5903]
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xWVJS-008XUU-1k;
	Thu, 26 Nov 2026 09:58:42 +0100
Message-ID: <72924d48-0fc6-4c80-a5c4-4f16362b0179@phrozen.org>
Date: Thu, 26 Nov 2026 09:58:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] pinctrl: airoha: add AN7589 support
To: Linus Walleij <linusw@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Ahmed Naseef <naseefkm@gmail.com>,
 Benjamin Larsson <benjamin.larsson@genexis.eu>,
 Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org,
 lei.dong@airoha.com, Linqi.zhang@airoha.com, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com,
 zhengping.zhang@airoha.com
References: <20261124094059.3882014-1-john@phrozen.org>
 <CAD++jLm7b_Q8aN5E7zjEU8CPknKYy0ui_LE+jPYJji-YzAWxJw@mail.gmail.com>
Content-Language: en-GB
From: John Crispin <john@phrozen.org>
In-Reply-To: <CAD++jLm7b_Q8aN5E7zjEU8CPknKYy0ui_LE+jPYJji-YzAWxJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_005853_750938_3E861566 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 25.11.26 19:28, Linus Walleij wrote:
> On Tue, Nov 24, 2026 at 10:41 AM John Crispin <john@phrozen.org> wrote:
> 
>> Patch 5 adds the IOMUX to the syscon compatibles. Patch 6 adds the
>> binding for the pin controller. Patch 7 adds the binding for the GPIO
>> system controller it sits under, which also holds the PWM controller.
>> Patch 8 moves the GPIO register offsets to the common header, so the
>> AN7589 data can describe its own register table, with no functional
>> change. Patch 9 adds the AN7589 pin data.
> (...)
>> - Split the bindings in three: the syscon compatible (patch 5), the
>>   pin controller (patch 6) and the GPIO system controller (patch 7)
>>   (Lee, Conor).
> 
> Once Lee merges patch 5 with the syscon bindings I can merge
> the rest to the pinctrl tree.
> 
> Yours,
> Linus Walleij


Thank you !

