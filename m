Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195A4606A320
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Nov 2026 20:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wvjE4vX9;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=do6kPe9/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GfcLwl9nMD3abzI9ow/CG21oWQfTAnmOPJtYxXca7Rw=; b=wvjE4vX9clfLVv
	BFJU73lgkJIZnhynVqOGNFK85Wly04D1FRPIlLbiT/d7JUrbL1BlwMgHaZdzwy4BoyVekJGmz9h9V
	9gNqCEBSApPlzoyuyySryvu5tX5cermLDoecfLql4LalmY9qu8HLbfZM9XFMWudIOF8UfSpkueDO2
	NRE0eU3pzBMhdb5Cj7bqKm60J/Inn+/hZWsXMevu46rXfm+vxRe5aTAaYK24AHIckBuZT5ASd8QMA
	+x5W88T61R5WBguRn8hLQVo2aHecXKgT/Ejgy/gOS72S6I0a1/uUqmH2LH6PfI23pphMc7FXHyDUP
	gpGDEXKqQkphhS09i8Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrm8-00000000DMZ-3Ou1;
	Sat, 21 Nov 2026 20:33:32 +0000
Received: from out-250.mta0.migadu.com ([2001:41d0:1004:224b::fa] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrm5-00000000DLW-2if7
	for linux-mediatek@lists.infradead.org;
	Sat, 21 Nov 2026 20:33:31 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=1+y3BvArKssnZYEujMUPhUqX1+rxcd5R0sMwYG3j6uo=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795293205; v=1; x=1795898005;
 b=do6kPe9/Bn6UTVidyQIaIpZc8AtauxqWEkzl/J+gM+Hdwff4qbBAY8ujFqemQ8bD1i9l0hoS
 nuhK+a3gQseJMvjXfmQpMqk7qLzYY16vF92f3XmfT6Sx8YxDLugswU602c+XoCpPdcuneslbY6F
 sfR/yaiipha7+4TbE55ebXertKF8VwO/tu6XdLbdzOTXpAAgb89a3u8gXwOuX2kUp76NFp43vPT
 DM4cKw56wcIMnKpylYtoVhMiL1OY8IRy9rNcMctrHT1U2RDQiQm3buNblZnzsUxFX+kF0NqEqHq
 L10fI3WtLFkWJ9oOXLqVVWnECTIj1aiPSQ7SMwhikD48A==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 743bb9bf1fbf2c97;
	Sat, 21 Nov 2026 20:33:25 +0000
X-Mizu-Trace-ID: 743bb9bf1fbf2c97
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH wireless] wifi: mt76: mt7921: let monitors see other stations' unicast
Date: Sat, 21 Nov 2026 13:33:17 -0700
Message-ID: <20261121203317.13422-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <c983f41c-ee0e-43e3-b578-cab9738d8da6@nbd.name>
References: <20261026220346.601314-1-lucid_duck@justthetip.ca> <c983f41c-ee0e-43e3-b578-cab9738d8da6@nbd.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_123330_157272_5E0129EE 
X-CRM114-Status: UNSURE (   7.43  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 20 Nov 2026 17:27:43 +0100, Felix Fietkau wrote:
> On 26.10.26 23:03, Devin Wittmayer wrote:
>> Clear that filter whenever the sniffer is enabled.
> Does the filter get set again when monitor mode is disabled?

Yes, though not always right away.

If a station stays connected, the filter is set again when the monitor
is deleted. If the monitor was the only interface, the radio stops with
the filter still clear, and it's set again once the radio next scans
or connects.

I read the register after each step of the runs behind the table in the
patch. Same on the MT7921AU and the MT7922 in every round:

    after deleting the monitor     filter
    with a station connected       set
    with no other interface up     clear
      then a scan                  set
      then a connect               set

Devin

