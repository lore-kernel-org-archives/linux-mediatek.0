Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA44C5DF86
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 20:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kk0AVAj9nGqTqVxVL78VvobkVLKEhMiHFP97YU4FPk=; b=JhKMKI14ClNd+YiWEphDz/yuEG
	e+w50uBSLyX5tnvPpvF0E9YdKQwk+32mqdmY0Qxf0YyuwVMjOfNxQxJ4Gpm0oEt4A3YemrHSO8ff7
	czOucbB7ZO0kKrRlxlRdBzIX50Ea+zATQFGxZMyGVRgIBJJg6DHkMSHN1m9UMJtX330x51tbmp+Lt
	fEI+lueWpI1YI0JR5rXJxfu67pPDgo2m/5V/05AJOAZLX5h0eusdShjP6KzaGDRKy+aH9eOwG/85+
	v/a99i8eh5292zTi2XjH1bqZ/AXWtlKGh487p4bpxV93/OkKV6xKwraceKnYOwYFzd5nETkEq//70
	UAyEnoQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx9N5-0000000CARr-134m;
	Thu, 20 Aug 2026 20:28:19 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx9N1-0000000CAQP-0S6J
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 20:28:17 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so564194a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2026 13:28:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787257692; cv=none;
        d=google.com; s=arc-20260327;
        b=O5nL21mNB1Rn75n/P13edqF+1sRSCvWtjkmX9TRCB51c8M4AMUdANHBSYaZEnWPJWx
         2WUuY2Truc0AnmKqLONvMMK+nvv3kBxAnR+MYJGTuCzSjb4qd8OBw/v1zoeKbb6W0Ijv
         rBltntRU6F55dass0FrSey8v5AY2/vhuVan8OwcXCW6j9n3561tSv8GAqH6Qm7p6W/5v
         ZQ79A0m1Xk52IcHKv0/8kB8Q064nT/mDlkQB7QlqOY8YT75cMY/+PyOL60pQ7cHMPbkH
         x1wUvJamdCb60iNMpOhnt5so8qWkYq+lrl/M4GSySRIEVOUIZVdgez56PL5mTPsqq1v4
         bYCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0kk0AVAj9nGqTqVxVL78VvobkVLKEhMiHFP97YU4FPk=;
        fh=cGU9P4OlADAE3ZR5iogLwJM+MeSYbCZUbemlQLMGYMg=;
        b=T6UlMm45FAomXgzln8BEIBrlOYBredijA6Rbe6aL/zFmA1znfLIoeRFK+5NyzZdGRh
         wB3Z8PAUuFjPGj/ZQbUnUSW1BrB4RFGBzTog5+znxi05PftpcnG/BVUaUh3EyCzM7Qoo
         aDy4IFaXFHj+H8sz6Q9UtYhKeBWfmB89kXnXrGM7O6kwA77ZZSQhp/dWqv/xzbNAnBtJ
         VjiSSLA5gf7gVSbb+2psZbeKYCpFs+8V6w60sHUfm0q2oHq8Q7q19hXmO3KJ0DbeRiDA
         wTuqdrk1eeEfm7KLsQzCgB77srHqINzbH1iNeXBBPLba+EbF6V/o8AQKeE6lnqe68gRu
         XZMQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787257692; x=1787862492; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0kk0AVAj9nGqTqVxVL78VvobkVLKEhMiHFP97YU4FPk=;
        b=bmef/OS9TNOOknRF3qQ2ggZOvLVqUzzUa+LryC2UOUNGK8s09gjX9lW3k0e1TeL7jQ
         FYrMf2hPS356x3ql80M6EXWNH4bWjVJydPomHcVIRUCkhadEqLLogvI553XMCPCbRfmU
         tNLN5lGAJ1pxCP7DqzbmlZQuq9dpa/Uj53w1WiXDX02GSAO0EWPePFYPe6IkQleE1dxe
         Bh1EQm57G4Z2KHXpt3Dl6jr39HG1Up06pETJshS05jFi73xt0EKdW3xsBeUYXQkxwCxe
         rZ5PKYMuDuBAiy5AgsUfy7Faz4xiR3UL86G0k3kteGQNj2c8HolZ33bJBeotSOw/jw8q
         hsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787257692; x=1787862492;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0kk0AVAj9nGqTqVxVL78VvobkVLKEhMiHFP97YU4FPk=;
        b=CM6CTZ+Ts1Virqikg/Wjbin0aFd0TA3AYLahjfuViXNEBkZRRA2vI4bY2s5OAx9JaV
         HCfn47meaqX66JiNQwDjatjMlOwRvHpdeQrj4Mwi7RrRSjqeAsY5IOJsSCQOrbj8WyNm
         uGmUium1qkBXHix3hxDqPFQIuBdtbZAI/7tEg986k5PZKKsg0EvKGeKmc9viTA2vBPFX
         99bT/0IVU2WFLWxqX8He5+UKBRVXGkmwm6W98p4GA31s0TxjRFj9HhxbCvT9jFjU0bDX
         JJe6ONa/QUZWO0PS/X8cIVfzuxddoLk563qdb7pEjMRGqHodcwxyI27o+mlul4oU6M8X
         22KA==
X-Forwarded-Encrypted: i=1; AHgh+RoEayObFuF20LtQPaUEA/SgFQMWoKZCJJLwxfJpp3mtWb9gnhLLP2SQpJCsyCMWGn1zfELFVmj72UcD7mTiOQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mPTnBJwVxqRH2SUjrv1mIvYAIc3ilnBlrTaTg/YW3sDGZ37Xhg
	X2GklSPzlI01NcfAWNmu7vZZjzEao9rn8dkaLfBm+K2rIP74fQw28HYL2nyusvsmZwyrxaz/sTe
	D+bXMlYOXJ/VU/e6Gp05trTfYzWIsEZ5fNq8uyO4=
X-Gm-Gg: AR+sD12p+mQn6J4QdHgupr+ZaV3GYBFZBV0CS5Dm9+VbKL6b2/XWx6LY5V20XZ8i0Vj
	L9bALshcqRRqm7/+YXu0xb5yjFjonpDcP0Rwolg/pLoKoyHg+BVcvTixw018kkUxkOPlkecuvI9
	r5U1TDmBNiMP+RDBohKpOBlcIJNwEUvgpI9K+JZo7gNLoTkA/IrXTVV600I7V/6fNYuhW54sK6S
	67ROTE8Hk3yeJemfVxDSDLsYUQKQob4v5QkS0l+uHTIKsVf05WdAmREpMZtTd6+eU8z6U5It2V9
	EUwou74uS6fW0wrTK/+WSfA58Ljr/kVHPeQg89b6TcTbisMb2wz6DSA+vs0bsRu8HwWI9pDdcLV
	urFjV2K6IhAInGhQj6WQLojwkDl+DRBSRrvYhe2aq
X-Received: by 2002:a05:6402:458d:b0:6a3:87b7:b5a9 with SMTP id
 4fb4d7f45d1cf-6a42f1f9d6cmr1132151a12.12.1787257692346; Thu, 20 Aug 2026
 13:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260817090601.1256389-1-pawlik.dan@gmail.com>
 <20260817161756.5fd2185a@kernel.org> <CALC2Apj7rQv=6uUqaqBjfJ9yO+VCddQqHB=yDhXH7+QUCh2JyA@mail.gmail.com>
 <20260818082933.28b5c9d1@kernel.org> <CALC2Apj-KLB5CVbSvoZWvA4Oan7dmAerK=VP7W86jmErWW8OdQ@mail.gmail.com>
 <CALC2ApiCSY8DkVpd7puTssbJZMWBHGVtFCnG66fiK0PX7-u3Hw@mail.gmail.com> <20260820101851.0b4c284a@kernel.org>
In-Reply-To: <20260820101851.0b4c284a@kernel.org>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Thu, 20 Aug 2026 22:28:00 +0200
X-Gm-Features: AcwNN1Vsd9SSDhiQPcdRUECjLI5GP2wK-pPfntddOHFbe8M7j0tkDMN1vuQpucI
Message-ID: <CALC2Apgp1rxK4d4z1XcRJv3=O+7uxLcMuNBS0OTi0TbwA+0Fzw@mail.gmail.com>
Subject: Re: [PATCH v8] net: airoha: npu: use cacheline-sized buffers for
 mailbox DMA
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, win847@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_132815_198766_11041E59 
X-CRM114-Status: GOOD (  14.76  )
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

Hi Kuba,
Fair point - the interesting part is the mechanism. I don't have the
EN7581 TRM, so I can't name the exact register. From ATF, DT, NPU
firmware, and the instrumented kernel path, the picture looks like this:

TL;DR: Sub-cacheline map length forces SWIOTLB on this non-coherent
arm64 setup. SWIOTLB sync/invalidation doesn't explain the failure -
the response never appears in the bounce buffer. Cache-line-aligned
streaming buffers avoid SWIOTLB entirely and the probe reads 0.1111. The
remaining question is why the NPU doesn't produce visible writes in
the bounce region (high phys ~0xFF6x vs vendor DMA pools ~0x84-0x91).

What's ruled out:
- No IOMMU/SMMU on this SoC; DMA addresses equal physical addresses.
- No EMI MPU - unlike MT7622/MT7986, the Airoha ATF [1] configures
  only TZPC (secure/non-secure for NPU SRAM and EFUSE), not DMA
  address ranges.
- No PMP in NPU firmware =E2=80=94 disassembly of the RISC-V binary shows
  zero accesses to pmpcfg*/pmpaddr* CSRs.
- No dma-ranges in DT - the soc node uses identity-mapped ranges;
  the kernel sees no address translation for NPU DMA.
- set_memory_decrypted() on swiotlb pages is a no-op on standard
  arm64 (no CCA/memory encryption on EN7581).

What the bus fabric looks like:
The ATF bus test code [2] reveals the internal topology. Each DMA
engine has a dedicated port through the R2C (RBUS-to-DRAM converter)
bridge:

    port 0: GDMA/HSDMA
    port 1: PPE
    port 2: QDMA LAN (TX)
    port 3: QDMA WAN (TX)
    port 4: TDMA
    port 5: NPU

The RBUS also has a "DMA block" mechanism (0x1FA000EC) that
serializes CPU writes against DMA reads within 64B/128B-masked
regions, with per-engine block counters at 0x1FA000F4-0x1FA00108.

All vendor DMA buffers sit in one contiguous region:

    npu-binary:   0x84000000 (10MB)
    qdma0-buf:    0x87000000 (32MB)
    qdma1-buf:    0x89000000 (16MB)
    npu-pkt:      0x8A000000 (44MB)
    npu-txpkt:    0x8CC00000 (64MB)
    npu-txbufid:  0x90C00000
    npu-ba:       0x90C06800

The ATF bus test uses DRAM_TEST_BASE =3D 0x84000000 exclusively -
no test exercises DMA at high physical addresses.

The NPU reads the mailbox command from the swiotlb bounce address
(~0xFF6D0000) successfully - mbox_status returns success. But it
never writes the response back; the buffer stays zero, causing a
timeout.

Read-succeeds/write-fails at a high physical address, while all
production DMA stays in 0x84-0x91, points to the R2C bridge's
write path having a narrower address reach than the read path.
Whether that's an address decode window, a write-buffer range
check, or a port-specific routing constraint isn't visible in
the open-source ATF or kernel code - likely hardwired or set by
boot ROM before ATF runs.

So I suspect this is less "swiotlb unaligned-length sync is broken"
and more "this DMA master shouldn't be bounced to that DRAM region" -
but I can't prove the bridge/decode story without vendor docs.

Regards,
Dan

[1] https://github.com/Ansuel/atf-airoha
[2] atf-airoha/plat/ecnt/en7523/cpu_bus_bl2_test.c


czw., 20 sie 2026 o 19:18 Jakub Kicinski <kuba@kernel.org> napisa=C5=82(a):
>
> On Thu, 20 Aug 2026 10:20:08 +0200 Daniel Pawlik wrote:
> > size=3D24 < cache_line=3D64 fails this regardless of address alignment.
> > The swiotlb sync code itself is fine, but the NPU cannot DMA-write to
> > the bounce buffer address range (it reads commands fine, never writes
> > responses back). This is probably an EN7581 platform limitation.
>
> Sure, that's pretty much what GPT told us some revisions ago.
> The question is why.



--=20
Z powa=C5=BCaniem,
Daniel Pawlik

