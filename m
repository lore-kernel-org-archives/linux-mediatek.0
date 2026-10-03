Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9956CA5FEC
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Oct 2026 18:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpgDRZ2WVE9/RIYpoegXOjD+9cyeHWpJxGiOpeqh42g=; b=rXLhxofcKKXVrptpW25+k64MJ9
	d7Z+eJ/ia5HrbJEhdZZQHLav2MmcK6kBcowLQZTwmksvzMf7TPh8Cf14+lCQUKL5opP7R6OCBfild
	NV7WMTMjhilZ73CggT4yqrFZzTo0jtmt5321aWciGZJ+Q0JnnLdn1fd3SeCWUbCUbdoyEh4MBVnxt
	NaeG7pnkraFnPqW6ze51Vz0EZSaLHwEKzC+EE2j2wJg9lD4kNpJlUkZc4PS7RZIzYpSgU0XEy82sr
	H23hIdJPMZSi2C9d8Hmf5f9AMy22noWYJozGphlD5a9t4gjJbH6W8IYQ/nXanYEL6T4cSSqSwsOvc
	oQlmV6ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD45O-0000000DtPi-27QT;
	Sat, 03 Oct 2026 18:03:50 +0000
Received: from out-111.mta0.migadu.com ([2001:41d0:1004:224b::6f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD45K-0000000DtPD-3NjY
	for linux-mediatek@lists.infradead.org;
	Sat, 03 Oct 2026 18:03:49 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=MqfQmQPpVqKDB8QrNFhFRvqM+3chzQRjnc5dl+pTy3I=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791050621; v=1; x=1791655421;
 b=BtNT9YMu31hjnaQNL4xfydF2w7oX+qCOqnLDFY/AVbeAQpgyR7EI6L03BBVNUeU1JriB9DC/
 69rvNnkJeXCHF9FBHmWXyp/FtMLIfZyINzSv0puguB7StEKOBLqaiHc1EYC3cWHzN3QoAdAqp6f
 NG6nVYE0aOiskJPKyevx/LyzMgV23NyfQlPWYL8dwsVcTVdQseADfGtTIaZsACerGweRV5+PTu1
 94RzuLGSLBflZqVMLFzvLUBR8NfhuDxZ1C0Vq63CzP/+2Stj9q8Ak3+S/Obnxl7DpG8Is8PlXs4
 hEEEx+YMkIi58Dy7SATK9r+1T9kbGrqUf2Ffesye9N5zg==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d500d405151bf338;
	Sat, 03 Oct 2026 18:03:41 +0000
X-Mizu-Trace-ID: d500d405151bf338
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Jonas Hort <jonas.hort@posteo.de>,
	Sean Wang <sean.wang@kernel.org>,
	Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Sean Wang <sean.wang@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	lorenzo.bianconi83@gmail.com,
	Andrei Rusu de Castro <arc@empyreal.works>,
	regressions@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [REGRESSION] mt7925: MLO connectivity silently stalls with 6GHz link active
Date: Sat,  3 Oct 2026 11:03:34 -0700
Message-ID: <20261003180334.83575-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <d245c4b1-dfba-4507-85a2-c6883f5eae64@posteo.de>
References: <503eb10e-80cf-493e-95fd-04fc0f94ce01@posteo.de> <e4bc5ce3-9a6f-4365-9d36-f6440ded0865@posteo.de> <c64f5fa6-4c61-45b6-a513-b971e59d7723@posteo.de> <476e7721-580e-4a6b-86e5-5ed782a2c7ec@leemhuis.info> <c9f984c4-e3c4-4e41-a502-99db97ce724b@posteo.de> <20260829221319.25334-1-lucid_duck@justthetip.ca> <d245c4b1-dfba-4507-85a2-c6883f5eae64@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_110347_637387_7950AFE8 
X-CRM114-Status: GOOD (  10.67  )
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

On Fri, 2026-10-02 at 18:11 +0000, Jonas Hort wrote:
> I just came across this patch from Andrei Rusu de Castro, posted on
> 2026-09-02 with "Fixes: ff643b81bc38" (the commit I bisected to):
>
> Patch wifi: mt76: mt7925: stabilize STA_REC_MLD link selection
>
> Could this be the fix for this regression? Devin, you mentioned the
> link count undercount is real but likely not the root cause - does
> this patch change that assessment?

The patch you found does not fix this stall. Andrei never claimed it
would and it did no harm here, so this is not an argument against it.

  bench A   2 Sep   MT7925 PCIe, 7.2.0-rc5 + lockdep, morrownr @ 6b0ef22e
  bench B   3 Oct   MT7925U USB, 7.2.6, morrownr @ 8e9309b
  both      firmware 20260813113118, DevLabMLD on 5745 and 6135 MHz,
            iw scan every 4 s under bulk upload. Neither is in-tree.

  run                     bench   last worked   at 600 s
  stock                     A        120 s        dead
  + the patch               A        141 s        dead
  stock                     B        122 s        dead
  + the patch, run 1        B        123 s        dead
  + the patch, run 2        B        123 s        dead
  primary link only         B        583 s        alive

Every two-link run died between 120 and 141 seconds, patched or not, and
none recovered. Each stayed associated on both links, reporting a healthy
rate while the AP heard nothing from the client.

The patch describes both links on every update. In August I got to that
same record another way, dropping the undercounting update, and it
stalled then too.

The arm that stays up describes the primary link only. Not a fix, it
hides the second link, but the stall tracks whether that second link is
in the record.

Thanks for your patience, and for the bisect and for finding the patch
yourself.

Devin

