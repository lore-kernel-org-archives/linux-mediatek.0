Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EE7C636D7
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Feb 2023 07:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/+NU3Tk03Wf0ez3AouViIcqSIg7JKhumDA5hc0v7rI=; b=y4pzixQACm0jXNIRdSxWDrio/P
	DKTIQYq3dLhjoHtBfgpkPfqZJ9EfFye3c0exwJeKnbagOziABj++v/UfHo3TRf27utFLJ3XHn8YAH
	QYnwI6A0sHrRAln38wAajCn8rr2u7FdOjxryhXZXHLSZvWVFpdWRMo/3m5JinfSWP2Nab4K5xn/XU
	hGAgp/91pNYpKjthP4qcTRGMLZIC1F5cet69/82Z9hdylEk0T/HT85xWR6j1cHZDekwZNgx4mim4b
	aaOqJlpjRFjrgGCu9h7zpcDDyohgtDIr1SGz86OkzGeFMvEGeRWitvpzZoK8WO7x7F/d9NtZsoN64
	NBZ6h0Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTHDH-00GXxX-3V; Sat, 18 Feb 2023 07:00:51 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTHD6-00GXvj-KL; Sat, 18 Feb 2023 07:00:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1676703627; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ibn/e0SI9GQh4lDLBhxqdlonSElsEuFMrplZzm3M/PffVKWad+sAvv+NUK1+YEjCyqE/+UW3K4R1ZIYlHW62TSvJ3bliQWSuLQm8nnMDvhwTe3yb67rn4/CceEg0BtAkXF4e+Bmxe6Gqt34BQam7Uqz48XJiffQTge0mPiE67S8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1676703627; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=m/+NU3Tk03Wf0ez3AouViIcqSIg7JKhumDA5hc0v7rI=; 
	b=AVAke2H7pJiYPOxLOOMh/x2vc00xvWnUWifJTj72x6JwVXv2JogcbVfMkQHigQ1ejWaO69rt7dQPDn+OqSZPLSGwxKEP+Y9PzhmPdtubph1c3ayr7tlcC0mewRhKLXvr76PwVNfUKEg+fauOY6bR5cGKFAd9FlEncwOw0JHOyG0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1676703627;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=m/+NU3Tk03Wf0ez3AouViIcqSIg7JKhumDA5hc0v7rI=;
	b=WS8aq3V/y75+JmBMJQbdrCOF7ESRzQjdb2LOiBU8iACugWUvW6k2tbmMI3ajHr5O
	Gw59JbBcWkggLNHoF6iuIoxZgQUiHdjNZtPRALFLEP2nbxGxZHUstl1gfpC6peYWxy1
	PhUmmRYM0RAlykVskLKodL0MUbv0uAA6ntIkGgAA=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1676703625115619.8764980966916; Fri, 17 Feb 2023 23:00:25 -0800 (PST)
Message-ID: <c3ab9a9b-3eb2-8fb0-d5d7-c0b7c684d3a7@arinc9.com>
Date: Sat, 18 Feb 2023 10:00:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 0/5] arm: dts: mt7623: relocate gmacs, mt7530 switch,
 and add port@5
To: Frank Wunderlich <frank-w@public-files.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 erkin.bozoglu@xeront.com
References: <20230210182505.24597-1-arinc.unal@arinc9.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230210182505.24597-1-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_230040_763862_8DA6CD0A 
X-CRM114-Status: UNSURE (   5.90  )
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

Frank, I think Matthias is waiting for your approval on this patch 
series. Is this series fine by you?

Arınç

