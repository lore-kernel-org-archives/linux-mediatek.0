Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9567D606A331
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 14:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oRwF6KOa;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=F5oOv747
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EiBM1lw6jtHc4Msd9f0+IoWSCWSW1EA52TQ2PRTxuNc=; b=oRwF6KOaOAqErE3KY36sYF1b88
	fhafhkB/+vT0jCItj4rlWtvRZE5vm6NTJ9obQ3x57E1wtK1fmVbj1wv6Ut8OmRkLX6cSBmjJW+p/s
	4AA0rwQ7kCcHpBsN/eZYru79NImotZC+AeGmR/LtfTTqtjyhvg+R96A7+6IoP7JbZrw7/9Mq0/NU2
	FiKw+D1NAZyFdwovXNO56Vee1B4PCius4hp2yK/UGqIyMgR0vU24Yb1WA6fie0lPYPFHt/smWV8Cp
	nuOg7NKBVnk++NiRiiPnsul1F7H3MVycO7JT300v+Evl7p0YnGNB2d5nMWwAZxeBEdl757pYjqS6d
	/V5oPWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxwJ-00000002vWz-15Uw;
	Mon, 16 Nov 2026 14:44:11 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxwG-00000002vVd-2ITL
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 14:44:10 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-49134c8509fso3482167f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 06:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794840246; x=1795445046; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EiBM1lw6jtHc4Msd9f0+IoWSCWSW1EA52TQ2PRTxuNc=;
        b=F5oOv747s6SsjAdnXXXx7QcKlnHMv/Jfcx4zwe05xP9gPXSDH05Z20Se2zP1TASWUH
         tCeQcoDs2DM4oH3ThPU3JmJwVHM930eETAzczdM2vfDAIAC3nq/D84haJ+64WVcF+5fw
         tc7doc+ziVD5LtbsO2oE8xz3KwxhPbCM41DK6IqfuLOqJNvNPL5Hx1p5aY6HM8uyd+RG
         jPlb6rzHJowVUQoQv4yVjQgNLIAeZ1jQJE43SDlpNkXZNpV1CHJ1BXhcUhibMvAIrVwE
         GzICyFRCSRRqGhv1pR/fadPKLD6ISq7Aet4/ipC2MKZRW27rHs584/kHpPYE+RdryjW+
         fH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840246; x=1795445046;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EiBM1lw6jtHc4Msd9f0+IoWSCWSW1EA52TQ2PRTxuNc=;
        b=mcjCwDDR/j/X2J+WzKjcW4bQhnFDvU+MggT418JxYWZZ1UsBDwAvlTALa2vJ9haGC/
         Odp5ZrJ3r2O9HUt5dANdXUb7+1D7XpYZX3hrCjfDcVJ+zpluGsHiVASvDxzGB+dVpS2d
         UYWFWrg32W9k1QmDuc+8gzTJqIuF1A7oiAB8kvGw7smOGBLDoLF8hFGgwD+9AMoudZUK
         xM0x/Ez3WoZ4I7Mqgu+KyqvQRRMV2mAthy5Ip6h5AxnKqZW9NcOuntwTxil285MzLK1e
         vDQn4+m7o13I1reqyteflzr9nq+YPyVKiSKYBXUpFPw7Vq/P/bLKdjws4yvPVcOzqXsy
         6ncw==
X-Gm-Message-State: APuU4Z9QPQazCSyWH983GfCEmw4MYxH+HOhtwJm39LZo4mXh4ep6QHB5
	+wfH4gXn3ycoLy7XvAys0eIyCNtiuSerL8/TrceXvQqL36zQH4fLgi3SX83PS/NBHAQ=
X-Gm-Gg: AZFdTZeq9ginYCARmamNjKPnBX7nvKvS31aPgpWMBE/CRMMjAbzt9N1Eq4y62uCKG67
	SfdbvagXXSglmn7JCdSNrKxmHjb0MX3i/UC5sFNgSYxxt5KjWv40o2lb+Ap6Z+x+1t5ekz7lrCt
	rz1pjOBx8E74aSgQBRUNSuyao75pNo9zAM2js7kPuLlOhdZVZ5x1g+UjyPZSJ1vzLzyMcRDoaYA
	q3ZLnh/BFy7eG0FCBGRC7zGId/d5E8GNldQ53dyNhtv2FvNf/EaUwz4hmfABFfvlzMZwB/PflhT
	CCgFEaLlVEoj6BV+cHJ2QRgfVt/cooa4I5ydCClAgeMfSf6xjFB7AsMmg0ykLiOyuOzWoSS2Wpu
	12NR5h14jAuolCzMwGdx3WHAUk/QLduAhu66kpheyhpwI3dvLh4NQhZ6l5LB6FYlOr3zkqvvAaF
	e2bB+WVLITokLodYEZywgFLCE3nfqMO20/kCkXK9vWFhl2BXcj43nyjrtzb3KHrbO7/yrdxg30z
	zfHfJsulsKSZAq221IRfpDumCFQ8qBRUMbnvGX93BPJi98ZqPI1QMK41n4eWGFpDuxbpmAoNajw
	KRaYGTzvQoBNx7ov93nfETxUWrDi1rH8o3T4gpwdbhJWv5zZdRC8woIuxXqGBqta
X-Received: by 2002:a05:6000:46db:b0:492:7d9c:fcf8 with SMTP id ffacd0b85a97d-49c73350e60mr16833660f8f.49.1794840245956;
        Mon, 16 Nov 2026 06:44:05 -0800 (PST)
Received: from localhost ([2001:861:80:deb0:b65e:146c:107f:26ed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60d9fff8sm24003588f8f.52.2026.11.16.06.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:44:02 -0800 (PST)
From: Julien Masson <jmasson@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: <linux-mediatek@lists.infradead.org>, <lee@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <kernel@collabora.com>,
 <wenst@chromium.org>, Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH PARTIAL-RESEND v12 0/5] Add support MT6316/6363/MT6373
 PMICs regulators and MFD
In-Reply-To: <afc3ec2a-90b5-440d-9710-2b3892b01b6c@collabora.com>
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
 <179239867012.642420.15110854236483587234.b4-review@b4>
Date: Mon, 16 Nov 2026 15:44:01 +0100
Message-ID: <8733t0ygy6.fsf@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_064408_603339_066CDEA3 
X-CRM114-Status: GOOD (  13.78  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Angelo,

The SPMI sub-device series has been merged and is part of v7.4-rc1:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=10c833da4dde3d9bb19e2092a33abafdaa16a341

Would you be able to send it in the coming weeks ?
We have customers waiting on MT6363 support for the Genio Pro 5100,
and we'd be happy to test it on our boards or help with the remaining
review comments if that's useful.

On Tue 20 Oct 2026 at 11:07, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> On 10/19/26 10:31, Alexandre Mergnat wrote:
>> Hi Angelo,
>> 
>> I'm working on mainline support for the MT6363 MFD PMIC.
>> 
>> Are you planning to send a new revision addressing the review feedback
>> on v12? If you don't have time to pick it up again, I'd be happy to
>> help address the remaining comments and prepare a new revision,
>> if that works for you.
>> 
>> Thanks for your work on this!
>> 
>> Cheers,
>> Alexandre
>> 
> 
> Yes, I do have a new version locally which didn't get sent because of the SPMI
> series (introducing the new helpers) that didn't get picked yet.
> 
> Cheers,
> Angelo
> 

-- 
Julien Masson

