From: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2] arm64: use is_vmalloc_addr
Date: Mon, 13 Feb 2017 20:52:59 +0800
Message-ID: <1486990379.5429.1.camel@mtkswgap22>
References: <1486640734-27637-1-git-send-email-miles.chen@mediatek.com>
         <ba5aeff9-4a02-8f5a-c5e4-e06c437875fc@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ba5aeff9-4a02-8f5a-c5e4-e06c437875fc@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2017-02-13 at 06:20 +0100, Andreas Färber wrote:
> Hi,
> 
> Am 09.02.2017 um 12:45 schrieb Miles Chen:
> > To is_vmalloc_addr() to check if an address is a vmalloc address
> 
> "Use ..."?

Yes, it should be "Use". I'll send another patch to fix this.

> 
> Regards,
> Andreas
> 
> > instead of checking VMALLOC_START and VMALLOC_END manually.
> > 
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> 
