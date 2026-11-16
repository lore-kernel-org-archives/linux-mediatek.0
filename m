Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BE9606A330
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 08:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JOsToXfI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tQ6LAo6u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WC45cvJmF2+vLRRaWf8G7eSygIPFDRykugAowc6yYyQ=; b=JOsToXfIX7sOCx
	YK53Irm5tjXdPaMkkoDDTstPkg3orradwQpMwFb9xhnwuTquu0NSMANTMN9eQJT6n3mxkn27HjRva
	YPwQY7I8XIUm3eRzfp9P4gCDY73VIwJu2vYYEf1/a/M2L298hWk992as9UWrxsxv6Wg4Y5rBbjr7J
	KsLAQG+Ao5P5nOr9jVr19TGXuYA3VCJlg5mL+xffRvu97XVpLjk62PJqUSOA/wTzON0OV7vE4lkbI
	wFkbvL37uwOUt2f7PRr6eQYDvaeDuzUtvafWgO63dUrLo7mGQGTClTX20FUNWeUhCMAluFtlDzK67
	Uj10UyB5tBfPbFv5GLMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsLc-00000001eiL-3Hgg;
	Mon, 16 Nov 2026 08:45:56 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsLa-00000001ehJ-1skB
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 08:45:55 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so1640921a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 00:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818753; x=1795423553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WC45cvJmF2+vLRRaWf8G7eSygIPFDRykugAowc6yYyQ=;
        b=tQ6LAo6uEXR/E8LnYCdw/c11o8V+xGE1W++icom0ES9NGzeggJad5bY66HJRPbMHlM
         7RGX6UY9DlkCFC/rhmPX9zJes0pnF5eRHQEARHpQlRq66XOq24sbNCsylUeJMxfoyTdU
         CKzTWl8G51maf4gdXflS/wj1Z9MGhAY+ZMElfBpw4I0KRqqFmbOTPY9UocfC1U8d8e1U
         /31Ibh8220TiYaJOiVMnIHgSD0ScSajUESWzxiEh6viTty0LKVGteANBbJ6a7cgYllT9
         c8FgZ7FBjzdlI+sX+Ie97V/DCE36PRN+nu9jGVon+lKi6KZIqUkGVki83oFxvJ/WcFn9
         amrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818753; x=1795423553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WC45cvJmF2+vLRRaWf8G7eSygIPFDRykugAowc6yYyQ=;
        b=UcEnLy9ZfOqXKvfEUSSjAUaFVMrNsRiZK9yXHO/FpshHN04ox/bwKdjoZxfamMCLsh
         8DFC5mhfe5HQFPwAotjqOdMt/02GsTuNhxdnShp97kyCCLpxc77E1lM0OPUq8nNYjm39
         R7wB/R+2ZWharukS8qCdvr+EXpjexQqcJ+I8UARAdYIbw7aBbSxjdiiZHNQ87xRKrHSJ
         BXeukphBRoQOVZ0ZmQcsYsYaP0rptU3wrDgzXCS0OZ0S/T1goonf1hG4rTqaa2khP0Q4
         3di3ka+H196WW7kpYWlQD6ItGUqj7Lltp1cEHgMl3iHfilE8jKi6Iz7AF5hysl+Lue6s
         7PWQ==
X-Forwarded-Encrypted: i=1; AL+hErGkfzHWLhJzA0udH1j3BUTTOYr50LSQ1nJklv2xwgGg9yZkHCVppI4ItghBMSKwZVCd+fGGBeR3gVwPIrBH/Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z+5ng5/tsDr7hZmc3KeCnpKzMGPgUpirQKZhR/HOZwIqBE9nnR0
	yVU8U71iyCWqbyedHb74TrKbdhsByc0iYJxmjJdxKK4U3l1XalBhWFG4
X-Gm-Gg: AZFdTZfb90xmOLFnBwvnbvC8Hqa3jk/DiYsM7qCsssnzbfnK6wYeVIPReWdUI7t7VqI
	EtqgpXpTSdsFUotzast35jwdF3rkWEyd/u4B+mvzRQ1pt/wjp4J1aBa9Rqn4VDGhK8bjnTYNSB5
	RM6js7JaTvMd1NXbyXJfUzSuNJMPhUqlAsMscXG9Rdb5uLm2dQEhDQ1zLFa3ILJm7QqFyjDYcqK
	IGUrld7iKCe09tnmb/id9NRR1pIqb6gL24ldhYmNpgU0ZHBziejbFok7nStybg8kJd2SLo3c2lc
	asf7JuinHbaMWV5/vCFF0gEDpCrAWBvVJUZUUxRybi+a777XUWijTM7LdKsIUC3r1/3kMjBNpD7
	0QFR0cuqyG7aGwdyhKGIOy7BiMnWkaAXldTvfi0d2WiKlcUv+jL0mKyMhbb5rgNjJimoNxrXxMH
	ehPwfFI2w3e5aFt6Cj1Td/wosuKTChiNEfulOoiu+oiJItg0xN+V8kXe4HuyJ4iWLS6ivkEBipd
	PoTAUBHEtHWdk8pGkx/ZeiWWg02ro5gUQRnKF7ujJsTOLhDuIwo+mlSqkQeLQtJ4BzK2K03r8EO
	J10ZWuk5ekWtjUqUgTfaOaKu4OGwi+ThlUspm/PYyTPeyqiHLuf0qAOdoSg=
X-Received: by 2002:a17:90b:4c02:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b1b0da3e56mr6437149a91.43.1794818753152;
        Mon, 16 Nov 2026 00:45:53 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:90a:5f11:9056:5eea])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b1e9ef15sm8861987a91.0.2026.11.16.00.45.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 00:45:52 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Ziheng Wei <zihengw03@163.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wifi: mt76: mt7925: fix mt7925_reverse_frag0_hdr_trans() for MLO
Date: Mon, 16 Nov 2026 16:45:22 +0800
Message-ID: <20261116084522.88724-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116081440.1011837-1-zihengw03@163.com>
References: <20261116081440.1011837-1-zihengw03@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_004554_489118_71DAD75E 
X-CRM114-Status: UNSURE (   7.29  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ziheng,

On Mon, Nov 16, 2026 at 04:14:40PM +0800, Ziheng Wei wrote:
> +	/* not every WTBL entry is a station link, e.g. the global wcid */
> +	if (!status->wcid || !status->wcid->sta)
> +		return -EINVAL;
> +
> +	mlink = container_of(status->wcid, struct mt792x_link_sta, wcid);
> +	msta = mlink->sta;

With the check ahead of the container_of(), the global wcid is rejected,
and wcid_to_sta() resolves a secondary link to its station through the
def_wcid that mt7925_mac_sta_add_links() sets.

Reviewed-by: Zhao Li <enderaoelyther@gmail.com>

Thanks,
Zhao

