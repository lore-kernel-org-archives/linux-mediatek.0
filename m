From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: next/master boot: 310 boots: 11 failed, 292 passed with 6 offline,
 1 untried/unknown (next-20190904)
Date: Thu, 05 Sep 2019 12:43:04 -0700
Message-ID: <7h4l1qsf5j.fsf@baylibre.com>
References: <5d700b15.1c69fb81.2abcd.479b@mx.google.com>
 <20190904192725.GI4348@sirena.co.uk> <7hzhjjsime.fsf@baylibre.com>
 <20190905153938.GB4053@sirena.co.uk>
 <20190905170257.GC31268@arrakis.emea.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190905170257.GC31268@arrakis.emea.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Cc: Steven Liu <steven.liu@mediatek.com>, kernel-build-reports@lists.linaro.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Thu, Sep 05, 2019 at 04:39:38PM +0100, Mark Brown wrote:
>> On Wed, Sep 04, 2019 at 05:15:53PM -0700, Kevin Hilman wrote:
>> > [ + Steven Liu who donated this board to my kernelCI lab ]
>> 
>> Also adding Christoph since this was bisected to his commit and Catalin
>> and Will since this was an architecture change.
>
> Thanks.
>
>> > Bisected down to this commit[1], full bisect log here[2].  It didn't
>> > revert cleanly on top of next-20190904, so I didn't get any further.
>> 
>> > [1]
>> > 419e2f1838819e954071dfa1d1f820ab3386ada1 is the first bad commit
>> > commit 419e2f1838819e954071dfa1d1f820ab3386ada1
>> > Author: Christoph Hellwig <hch@lst.de>
>> > Date:   Mon Aug 26 09:03:44 2019 +0200
>
> I stared at this commit and the ones around it for a while but couldn't
> see anything obvious. AFAICT this commit only replaces some macros, no
> functional change.

This is a an arm64 mediatek SoC (MT7622) so hopefully the folks on
linux-mediatek can take a closer look and see what's going on here.

If someone can suggest how I can enable an earlcon on this platform, I'd
be happy to give that a try to see if we can get any kernel output
before it hangs.

Kevin
