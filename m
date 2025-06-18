Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C64C7115A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jun 2025 17:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnlKsyG4fMWCQaM8lEHdPX48UNrwNSibT67INrhosJg=; b=qGs4mfDIjGXk11fk0el8r3oOmv
	90nvikyN8xHhs+vyPLRMyoJXrsMQCW/C0E0LF2YSE6zD+RwX+DELE4jm6ZWbfDQBYT5q8UWeRbAM4
	s07j0h+h1CjYO4ReSiU8O0t+xHMr3c4GzNbWSTHAxK1zoDvbPhiPMPfJyrAHEP/eVxWZn6enG/+M6
	PJE66NdAXdCz4sqCtKaJQzO/sQ+HwOvCC60Zu6H13bPbTZ20m/NPaJMVbQbgutuAARbZL8pxIH2LM
	2piL1eqjMVDQem93xHIvTFSgNZQa+ACvHkkDYTJU6tLt5mIlloOXRX0inqrNTAUWN2tSwx9UfvGoz
	PNkIa4MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwdA-0000000ArXy-30Ij;
	Wed, 18 Jun 2025 17:31:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvkM-0000000Ajue-0zSV;
	Wed, 18 Jun 2025 16:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MnlKsyG4fMWCQaM8lEHdPX48UNrwNSibT67INrhosJg=; b=bTry5vSGReg0fSd/S00Wejr22W
	XsBdHJdQXB8cIr1GyS/T/YKfh9yOUVmHmEnwALoYaRA3ZLWByEVtH3M5XJTeEqtzxzh8xmHfVbz4c
	Ccx9L2iT0DvUjhuA2Q6SS70uuvN5SMRM6DXkWiRpG7SFsBV/DwXEIjWxTGn1CG5TumgEbjHPlXM4D
	LF73o8Ky1cgVPa6sByCJhEG+QacZ/9phcpqowXknhK5OeF1pBhErUozlGgOEjiG+LXGJsH6tXm7ww
	LMLnZ47f+AQR7zv1coYRMec1YD2wGUmGJic9uKNAUUGA+Gjirap1aFAmPgwBUkcaNkUGErSGMsVcO
	Hm3l91RQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvkJ-00000004C25-2ZG1;
	Wed, 18 Jun 2025 16:34:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3DC7CA51B33;
	Wed, 18 Jun 2025 16:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D14C4CEE7;
	Wed, 18 Jun 2025 16:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750264477;
	bh=ZpjxbXJilygZEa1TmasV23ZFXaekM2vT4FxyFQzIqSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FhljU//iM84aUdVU8yuWaVilgx676eJhlxkMjsp8ZvVPjIj7WnUaN6i85prBo4YTx
	 0KYOgkUCisvck2qI3pOpodE1buIr/eI9jDqIZBcLCHp1dI1vuFNMa7uNYBCZsWiuK6
	 hoRHmxH3bLyqdOcDjoDSld86OS3NtmVHFZHeUEFu60mOzVCYbwGMhOmnkUxJfkDQRH
	 B8MAd8VxIVuzhDMyJ+q0PO9wgeC3Sq4lsI2Y/0CRETbYYYb+re4CZpZmfc65yx//71
	 +k8EYCkImnaDRGNiuP6sq5vEpLXOV6QO518mY0nBGV972wP8xCU+37uYpGcaj5XrpJ
	 4Y2Z/Qqnoxoiw==
Date: Wed, 18 Jun 2025 17:34:33 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v3 1/2] net: airoha: Compute number of descriptors
 according to reserved memory size
Message-ID: <20250618163433.GR1699@horms.kernel.org>
References: <20250618-airoha-hw-num-desc-v3-0-18a6487cd75e@kernel.org>
 <20250618-airoha-hw-num-desc-v3-1-18a6487cd75e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-airoha-hw-num-desc-v3-1-18a6487cd75e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_173443_819566_E1DA9D5A 
X-CRM114-Status: UNSURE (   9.23  )
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

On Wed, Jun 18, 2025 at 09:48:04AM +0200, Lorenzo Bianconi wrote:
> In order to not exceed the reserved memory size for hwfd buffers,
> compute the number of hwfd buffers/descriptors according to the
> reserved memory size and the size of each hwfd buffer (2KB).
> 
> Fixes: 3a1ce9e3d01b ("net: airoha: Add the capability to allocate hwfd buffers via reserved-memory")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


