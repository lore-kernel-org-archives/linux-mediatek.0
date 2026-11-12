Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77852606A331
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 07:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=USCtcS8k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yXljFrMHuNZdAD8pJZ58StWeAWXC+mtlKfyCWGcsFDE=; b=USCtcS8klZiYpS
	V1i09q5lvu6rPFok/+qnVhlG+QDe1iQy/9OUKbbH/xte7ETNtCj/G5A5p19G3R8s2UbqSgiPD0tkM
	mg70ADS9G248CvCKtGU1I7uJfpQqW82bTVaqZ3llBTc/YkKBgbYmkOj17tGop9h3Ga3NncI0OXPT8
	pY263OFsSBW7VLT8IXghR6aPcUBcIxyvK0CxxKWHwr2Hyxgcqt+mH+Awl8gx9oUHhmUbnkk6jyD1L
	v/b+G0JNQ8SIejQt+doDHHiFQ+Zazb/sBPRSW+IsBJvXrpp+Y1a9tiZurox2PVKG4enozNAt69C/J
	BtRrj0AP/4OCdTLPlWug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPgD-00000008zvc-0GYM;
	Thu, 12 Nov 2026 07:57:09 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPg8-00000008zuG-2SNl;
	Thu, 12 Nov 2026 07:57:06 +0000
Received: from [2a04:4540:1403:f2fc:6c6d:98d8:5537:56be]
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xRPft-002Bve-0y;
	Thu, 12 Nov 2026 08:56:49 +0100
Message-ID: <651220fc-f1ea-49f2-9992-a1b3e31d1bb1@phrozen.org>
Date: Thu, 12 Nov 2026 08:56:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: i2c: mt7621: add Airoha AN7589
To: Conor Dooley <conor@kernel.org>
Cc: Stefan Roese <sr@denx.de>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org,
 lei.dong@airoha.com, Linqi.zhang@airoha.com,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com,
 zhengping.zhang@airoha.com
References: <20261111093941.691801-1-john@phrozen.org>
 <20261111093941.691801-2-john@phrozen.org>
 <20261111-federal-pleat-191852ed2822@spud>
Content-Language: en-GB
From: John Crispin <john@phrozen.org>
In-Reply-To: <20261111-federal-pleat-191852ed2822@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_235704_630296_49687C67 
X-CRM114-Status: UNSURE (   5.82  )
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

On 11.11.26 19:11, Conor Dooley wrote:
> I assume a fallback is not suitable here because setting this wider
> divider is a requirement?

The new registers offer a wider frequency range. I checked that the
old MT7621 registers work on the AN7589. They do, so v2 will have the
"airoha,an7589-i2c", "mediatek,mt7621-i2c" fallback.

Thanks,
  John

