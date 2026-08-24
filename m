Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D3EC5DF94
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 15:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQM9PhntWAt2lt8k5M4COgt8bAYljmeqxXab3pR2gKM=; b=onuyL8ETSUkQ9DtP+v5iiBfQgh
	P8BZPr/UVo/i3di5rCMoRBXc486OaQeWXJEAa8syLaXZqk6y8hYGFswMt0MUMMX1tZOdqVP6ru/eb
	kv1A/Mr9cD8fGds1HgstnR1xc2Pb05qe6hDeTAb7IZlmD904OK6l0edbrqMn+j/lstSf63LQznnf9
	bv3WSvbadG5wn5hUd8RBG0rVMPhmoJlBx+C+jmECOSOLNHD6NESGGzxuNUbc8FgagxG31UxKbCeoE
	uNrp7PzZbmpEVVuqu4nrkwyO9n6g7meIU7qjyqqfvZeFBDxY2XGPxZ+j5jGoas+qGFImz4Xncxzxe
	3QO+rGOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWcJ-0000000GvhP-2rG9;
	Mon, 24 Aug 2026 15:29:43 +0000
Received: from out-189.mta1.migadu.com ([2001:41d0:203:375::bd] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWcF-0000000Gvff-1Tza
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 15:29:41 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=TQM9PhntWAt2lt8k5M4COgt8bAYljmeqxXab3pR2gKM=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787585375; v=1; x=1788190175;
 b=DwQAdg+NvfOLwXda4JA26GXw2phcKyTsIl3+Obge8gztA0zBlYbqoyhyWZ/fWJVdq/R3dkXn
 +uqFu16g/BxUYCcBsNFkACQ5NaCs6XrUVzEnIkpoK96MvpO4nD+RV3LmhfGDi5hAhAW+FGg+nFa
 P6Di7mo1o+zKgIkXpcW1e4QwZoNbUWiGCBv1PW/1qZA71ii/ROjzQ0es3x4gQRVDrjHXaHRr9qa
 XKEOKdOfUZ3KAHoEg5or63rEYt4bVU4yUGx4+/ke6TTmpVCnpeB/4pnJvPtY75lwXBlqDWTW1kc
 yjpNb5JKfM265sfK/azQcRAKz+2w68AA8MgFNR5Fp6GCg==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: from fedora (2001:569:be59:c500:b340:3f2c:4486:21c1)
	by smtp.migadu.com with ESMTPS id abc171f7b01dda4c;
	Mon, 24 Aug 2026 15:29:25 +0000
X-Mizu-Trace-ID: abc171f7b01dda4c
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Eason Lai <eason.lai@mediatek.com>
Cc: nbd@nbd.name,
	lorenzo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	kun.wu@mediatek.com,
	deren.wu@mediatek.com,
	sean.wang@mediatek.com,
	quan.zhou@mediatek.com,
	ryder.lee@mediatek.com,
	leon.yen@mediatek.com,
	litien.chang@mediatek.com,
	jb.tsai@mediatek.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 0/2] wifi: mt76: refine USB/SDIO TX path error handling
Date: Mon, 24 Aug 2026 08:29:18 -0700
Message-ID: <20260824152918.11268-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819082129.1062282-1-eason.lai@mediatek.com>
References: <20260819082129.1062282-1-eason.lai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_082939_990098_C2CE0507 
X-CRM114-Status: GOOD (  11.68  )
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

On Wed, 2026-08-19 at 16:21 +0800, Eason Lai wrote:
> This series fixes a UAF in the SDIO TX path when out of memory and
> a memory leak in the USB TX path.

Thanks for turning that around so fast, and for taking all of it. The
code reads right to me now.

One thing to sort out before it lands. 2/2 is marked for stable and 1/2
is not, but the two only work together. The padding helper frees the skb
itself when it fails, which is fine today because the caller returns
without touching it. 2/2 changes that, and starts reporting the prepare
failure with a skb that is already gone. 1/2 is what stops the helper
freeing. So a stable tree that takes 2/2 on its own gets a use after
free where there is no bug today.

It will not get caught on the way through, either. 2/2 applies and
passes without 1/2, because the frame returns before the padding runs.

Marking 1/2 for stable is all it takes. The stable rules say you do not
have to list a prerequisite that is already in the same series, but only
if that patch is itself marked for stable.

The Closes line did not make it onto either patch:

https://github.com/morrownr/mt76/issues/83

Devin

