Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFFF606A320
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c9EtP1+1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:References:In-Reply-To
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d9oSnze2vw3oc+VVxfYM2BcxQUZjEbs0B685TTsdPkk=; b=c9EtP1+1FpRDc8ORMpSbSBRpCJ
	XsYaFOzEuoDB4aFhINLPDqQz6I/ovbA8q6MtkNRXSnarPwzatMGrqIcJDfe6kTenfU0yEvjHtAi22
	OzjsSpzQEjrgpPPGiU9G4+Evou+NjIBgZb4+FpQrT4APeKVUP71L+InspEFRYrnBWdulpjluBEbTb
	YEg3d0d61kyJwDB8k9wgBf8oJsICataLGWh7AdapXGiPaI5tsqzHFCErGRKysYgmTJuWmbFA/YKxB
	0B0LQ6JP6eO0p00ea8HKgybnLulxtzev2NrmI7/kUZS0jgydFgZdNxNKaK6BLJoOYi4/ecTvRh8bn
	1WIfpj2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzak-0000000FvqP-0J88;
	Sun, 08 Nov 2026 09:53:38 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzag-0000000Fvpv-3Nf1;
	Sun, 08 Nov 2026 09:53:36 +0000
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAB3ELabRvBq5PiYAA--.38431S2;
	Sun, 08 Nov 2026 17:53:31 +0800 (CST)
Subject: Re: [PATCH] mailbox: mtk-cmdq: Fix GCE clock reference leak in
 cmdq_get_clocks()
From: Wentao Liang <vulab@iscas.ac.cn>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <2026091720-erased-urchin-8903@gregkh>
References: <20260917093745.2144930-1-vulab@iscas.ac.cn>
 <2026091720-erased-urchin-8903@gregkh>
Date: Sun, 08 Nov 2026 09:53:42 -0000
Message-ID: <179413162201.2723269.10723981032501014855@iscas.ac.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAB3ELabRvBq5PiYAA--.38431S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFWxWF4DtrWxuF43WrW7Jwb_yoWDGrb_Wa
	yvyr9rWw18XFW7ta1DCr4UZrWSg3yUu345G348Xa13t34UXFsrXFs8K3s3ZFy3KFWSqFnr
	Grn8Aw13Aw47ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxkYjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWxJr0_GcWlOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxAI
	w28IcVCjz48v1sIEY20_Gr43Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8
	JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5
	FksPUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRIFA2rv4kic0wAAs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_015335_249130_7FAC9343 
X-CRM114-Status: UNSURE (   8.96  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Greg,

Sorry for the very late reply, and for the confusion and extra work this
caused. You are right: I kept sending patches while not answering the
review comments on the ones I had already sent, so it looked like the
patches were coming from an unattended bot. They were not bot output, but
I skipped the part that matters, and having to drop them is work I caused.

For transparency about how they were produced: the candidate issues came
from our static analysis tooling, and I used DeepSeek and GPT-6.1 Sol to
help audit the candidates and prepare the fixes. I decide what to send and
I am responsible for it; the problem was that I sent far more than I could
follow up on.

I have stopped sending new patches. I am going through the outstanding
feedback manually, one thread at a time, and will reply to each one. I will
not send patches in batches again, and will only submit what I can review,
test and answer questions about myself.

Sorry again for the noise.

Regards,
Wentao Liang


