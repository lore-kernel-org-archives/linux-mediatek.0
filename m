Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA9AC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 06:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Date:References:In-Reply-To:Message-Id:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTgY8DspdCk02r/eJDOuN3XaUdRddpWzX59neODEuwo=; b=lmRmuINKqZO0VN2CR4VrI1VjPt
	ljjRm6Im3aCoKcNpRElC1RrLvhODdJ33Ew8zwoR34CfoboLSeQBhbymJ6CUw1nB1cZ7fOkyL2Jr6B
	kSZ50LIFw6HMcXCHrkUB1swa3snZxYa7lNJm1wYsiWuNleKiklth0Tx5gcYxFdRruP18mDkhMfel4
	8HOpXun9Tm7/MSoKKqUzbzclDMEs2HA9RPiKhkebUEtPLgnUvpWtNVgz8rvocYma4KQxOpMdPTgx6
	FVLZFNuhBxK/Hn1IMigtALJu3+pzaLzSj1sJhs9PJB2QruEzWiFgo6AjbhSkyCRn5Hwsl7yDNlqLC
	/VVnUn1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1hAj-00000005JCQ-08hO;
	Tue, 30 Apr 2024 06:41:01 +0000
Received: from fout6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1hAf-00000005JAn-2FWO;
	Tue, 30 Apr 2024 06:40:59 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id BECC31380415;
	Tue, 30 Apr 2024 02:40:54 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 30 Apr 2024 02:40:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1714459254; x=1714545654; bh=UTgY8DspdC
	k02r/eJDOuN3XaUdRddpWzX59neODEuwo=; b=STDPKYdRjPLoKfQe02dw/kV4/E
	NNRJ9YQhmxt0ID0EY3PcOSK9osq8cp8TgbFKwqkrhhpiR5OOFxodX1SrjCqkVK+N
	/I31729nShKAzxj2Lq2Oal50jnDQEDWDSQ9BGGxCuOzwkOSJqhITq1ziFRkTzq3Z
	i9MIhtZgG75yO5cKoMS+x3G+/rSOjuTkZxpcDSOEl7D9IZ7SFemRM+li2r6kOsUN
	8BaSFQUN6fAXVoFb4oX1d+/soPbj4nMruX0TqUizbuGzft3+LsOJldorZwczxCRB
	x+yDEfblXXNEWqF8vL02geSbSrbA4bqF6jKtQ3NdyYOBtlewC/H5o3mXjuoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714459254; x=1714545654; bh=UTgY8DspdCk02r/eJDOuN3XaUdRd
	dpWzX59neODEuwo=; b=O4fKpnH7Kkfyx25MQrloyM/99rvjv7Di5oCk24CjIWCg
	VpDklgd123sQUU/M7LkIfSiGczTnuJwRy0UdZjDOsRAZSq/HKfxq8wmAzacxvJ8X
	/75FtKU2bN9cOi2+e0GyV7taArrKbQldCjbdmmICI0MKQSFFwLHdeUftskxUD+3U
	aJGjgJZgN5BXjjKgjP0P1HDtbJCkVytpYz1WqcxHE66ITtFjFwtWCn3Uh1MQAxvv
	tiHvxH+mJC0wmD1n8WlkPTlOJkIVu9rgi1I+DO1W+KbBQXKbVrKT+HCWDkNa/5JF
	AGKV/grjkhp8/eZf6S27G3JnCaaCMA+v8RFKEFS4dQ==
X-ME-Sender: <xms:dpIwZrwRIPH0E9G-Z1afueN-q8tTDC0CTuIqb6ZhT8EQOyOVbn-srA>
    <xme:dpIwZjSR3CNfNHXoLItSzsXe5Wguy5Z5EbldhUV3yOAH0cftuzR9hwQd3IlMf77D4
    xzdV0zILDKhYSxOybI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdduvddguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:dpIwZlXjrlpPZS1wRYuFr9vGtRrJlJzU-cUyhHkfpajmmDvKCOQJNA>
    <xmx:dpIwZliV9ElfWpyYJGBVLV4RWnmNgR6O8JKSNMDYzo2j6bZG5g9nXw>
    <xmx:dpIwZtBqtHQlzCPUtKGq61RLpHRpEp6fMW7uZCGEScXapjPKvJC2Rg>
    <xmx:dpIwZuL2biEtdOEwt5yEEVYn_Iti5EjJRXtSorpWTUv9fN117g9RFQ>
    <xmx:dpIwZo8CyZ7CEI75cKXVE-b26aWVOU-HjR23eeVQOGyTOC8n0BxyX7AN>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7B5E8B6008D; Tue, 30 Apr 2024 02:40:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
MIME-Version: 1.0
Message-Id: <dc4975fa-82ae-4b2b-94f2-c518595f8694@app.fastmail.com>
In-Reply-To: <20240423102915.371782-1-angelogioacchino.delregno@collabora.com>
References: <20240423102915.371782-1-angelogioacchino.delregno@collabora.com>
Date: Tue, 30 Apr 2024 08:40:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 arm <arm@kernel.org>, soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 Device Tree fixes for v6.9
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_234057_920877_A88AC198 
X-CRM114-Status: UNSURE (   9.39  )
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

On Tue, Apr 23, 2024, at 12:28, AngeloGioacchino Del Regno wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
>
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>
> are available in the Git repository at:
>
>   
> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ 
> tags/mtk-dts64-fixes-for-v6.9

Just FYI, these were both merged into v6.9-rc6, but you got
no automated notification because I had to merge them manually
into the arm/fixes branch.

The problem here was the ssh://git@gitolite.k.o/ address, which
does not get picked up by the automated tooling, and I see your
later pull requests have the correct https:// address instead.

     Arnd

