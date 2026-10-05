Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DEDCA5FCE
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 02:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkvVqhcVh0upTpQG5gYm9+Ngk0GVIv6WhrSt7kpbNwk=; b=QJ4RO51DcSfEub1TymRugKA+XK
	WGivHwxCR3LLFYMaEHSN1toaGzVbHL1x4cMsF6oOuscY7q0diD8e0hy7e94eEvlHzLli5xTaqbQx5
	zuDn3SyetXvB5g/R78wTHRpq84T/brSbyOzkOkmNCG69mEljRdNZvxJInCxbLewxSMtDq8ZiyMgF+
	ddZf1MKnMiq6hHxgaabydsHbaCNWjtkiuI3ajU0AJZBXwb7tln2T38i43HmPDysQJGaoxCl17o3zA
	XJJ7+UkwZDv5xFpab0Rwa/nDpv21d2cL1BDo3pjtXBUhpwXXfb+JA9ICUubp+YPc3aTsz9yLUBPQS
	eiIV1hfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDYgy-0000000Fbe1-1RGS;
	Mon, 05 Oct 2026 02:44:40 +0000
Received: from out-149.mta1.migadu.com ([2001:41d0:203:375::95] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDYgv-0000000Fbdb-2JhI
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 02:44:39 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=4+oVFRM4GfDtzhNlYe798i332jr//6Fy6ecJ1GrKyl0=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791168271; v=1; x=1791773071;
 b=EudYtatoU3a5LkeAEHtYKRkpfO02k0+SK8O088uU45zBANISIVq4HvjHxqzUAbg9LGIobAYK
 BrZ+ryY4SbGX36M2gxKx2Z0Ni/sqAw76TVmmRFgBzdHuBeeX7/d74WqQbOFbpL6uU1G7fm4uqBR
 bpfB7QqiG+MuepIrxG6R0jC9oBLStnhI/uNM4Hy97v8lgYyQIs+r7NacqBXK6ckzJTCftbmYCAG
 hqrKuKBxVefXnINioAJXKezkPVcaZHM2GYYQzseb6L3m2ULL/jCFpLcWg2G2rOZWx33i2IYoYqD
 XxYazYDOsBtnvMTcV9hoD0zC3G6nKp8URZrcVY3kj31KQ==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4523754c24812559;
	Mon, 05 Oct 2026 02:44:31 +0000
X-Mizu-Trace-ID: 4523754c24812559
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Andrei Rusu de Castro <arc@empyreal.works>
Cc: linux-wireless@vger.kernel.org, Jonas Hort <jonas.hort@posteo.de>,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] wifi: mt76: mt7925: keep MLD membership consistent
 during link add
Date: Sun, 04 Oct 2026 19:44:27 -0700
Message-ID: <179116826771.8124.9499876634833237978@justthetip.ca>
In-Reply-To: <20261004-mt7925-mld-v2-248bb5e6404f@empyreal.works>
References: <503eb10e-80cf-493e-95fd-04fc0f94ce01@posteo.de>
 <e4bc5ce3-9a6f-4365-9d36-f6440ded0865@posteo.de>
 <c64f5fa6-4c61-45b6-a513-b971e59d7723@posteo.de>
 <476e7721-580e-4a6b-86e5-5ed782a2c7ec@leemhuis.info>
 <c9f984c4-e3c4-4e41-a502-99db97ce724b@posteo.de>
 <20260829221319.25334-1-lucid_duck@justthetip.ca>
 <d245c4b1-dfba-4507-85a2-c6883f5eae64@posteo.de>
 <20261003180334.83575-1-lucid_duck@justthetip.ca>
 <20261004-mt7925-mld-v2-results-248bb5e6404f@empyreal.works>
 <20261004-mt7925-mld-v2-248bb5e6404f@empyreal.works>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_194437_947381_5E72BF72 
X-CRM114-Status: UNSURE (   4.61  )
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

Andrei Rusu de Castro wrote:
> USB hardware and the reporter's FritzBox setup remain untested here.

Tested on a Netgear A9000 (MT7925U, USB), Linux 7.2.6, firmware
20260813113118, morrownr/mt76 at ce4ee3e, against a two-link mt7996
AP MLD on 5745 and 6135 MHz.

Your STA_REC_MLD capture reproduces here. Without v2 the AP got
nothing on 5745 in any run I checked. With v2, 5745 carried traffic
under the scan load from my earlier report:

                                      stock          v2
  scan load, 600 s, mean per ~10 s    249, 267 MB    801, 837 MB
  scan load, 600 s, lowest ~10 s      126 B, 33 MB   643, 687 MB
  scan load, share of bytes on 5745   0              about 60%
  scanning off, share on 5745         0              0

Stock dipped under that load but did not stall for good this time, so
the stall result is Jonas's run, not mine.

Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca>

Thanks,
Devin

