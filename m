From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2] arm64: use is_vmalloc_addr
Date: Mon, 13 Feb 2017 06:20:47 +0100
Message-ID: <ba5aeff9-4a02-8f5a-c5e4-e06c437875fc@suse.de>
References: <1486640734-27637-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486640734-27637-1-git-send-email-miles.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Miles Chen <miles.chen@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Hi,

Am 09.02.2017 um 12:45 schrieb Miles Chen:
> To is_vmalloc_addr() to check if an address is a vmalloc address

"Use ..."?

Regards,
Andreas

> instead of checking VMALLOC_START and VMALLOC_END manually.
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
