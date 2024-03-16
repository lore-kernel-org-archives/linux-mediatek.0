Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F381C54E60
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 09:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLsztMZ8AnZVIz4bQcF9FyUQ2mwfMm1gz36aKSiWLpU=; b=RVUph/fi1ObMsNJFzIkr29ztre
	k5ERzVIWMiYeAZC61rCAUpbEBajjFzyxCzBRCyuTgx1uWFojtwCYVbfgBDZBhjBMgF+9sUwOTxm9W
	plofVziH31mdYnKgenh/HbZg4jtSru9xMT1UmJehKc+6sDY/kJspDKJs7rhuwExyxifcVqZG6cdVv
	pPpUjCTrGiWTAqb6wOgnBodBTJsQ8cw3RzOX0GScnEIG1uzeYzDeOP7EWoQU8crsiaRB0/HCWq1V2
	h/D+5UNJe6o+3X4rxdoGxCHhYR5Wb6gwaDyKkOdSsM39FD+uJOG23GUaytO12/JZZgLNutyqBEvBa
	7+O6AfhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQEB-00000002qDu-0EOg;
	Sat, 16 Mar 2024 09:21:19 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQE7-00000002qCu-0CzL;
	Sat, 16 Mar 2024 09:21:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D00A120002;
	Sat, 16 Mar 2024 09:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710580873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sLsztMZ8AnZVIz4bQcF9FyUQ2mwfMm1gz36aKSiWLpU=;
	b=dZgDMy6Y0euTQFlpRUqSK+TtXgaTRVBcKf/pfh3FBIWvkncQNqVz/YAGEGLESVyJ9KvsoI
	/xzPopjNm7qJcE1j2/A2ttu60nQpQyXeHWPZnBnf9rIct8a0onLVOJGo1+zA3LxIM6w+WJ
	dgetEfvwrCXyN6WIdSo8mJ5khhS802kq+Y4p+siY98cBsS7g9FRkesTOcCOV7h1wHWALdv
	iUjJoVnk1JV95F6Ww4VTX66h3EU0mcGzHXrvl+PvM+J3+2UoKZHy4E53cug/jLMo8nuuWa
	EaunDnI9Re6RYfaGBaYTCFnE8EOgEhzzreP5/8wjbrOmuQqnl6SztqG4dGNaow==
Message-ID: <e61a4dfd-df2d-41c1-b2b9-80476863213b@arinc9.com>
Date: Sat, 16 Mar 2024 12:20:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/14] mips: dts: ralink: mt7621: reorder mmc regulator
 attributes
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <20240316045442.31469-4-justin.swartz@risingedge.co.za>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240316045442.31469-4-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_022115_247860_A3FC3621 
X-CRM114-Status: UNSURE (   4.46  )
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

On 16.03.2024 07:54, Justin Swartz wrote:
> Reorder the attributes of MMC fixed voltage regulator nodes
> for the sake of compliance with the DTS style guide.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

