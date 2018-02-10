From: Kristian Evensen <kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Questions about bringing up MT7623 board
Date: Sat, 10 Feb 2018 23:02:39 +0100
Message-ID: <CAKfDRXhhrndoKMidZYsw=E8BmS7AFsTJHbS4dcYbEoADhjD44Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hello,

I am currently working on trying to add mainline support for an MT7623
board I have received (Unielec U7623). I sent some initial questions
about the board in the autumn, and I got OpenWRT running in a
semi-stable state (with 4.9), but adding mainline support has proven
tricker than I thought. After spending some days banging my head
against the wall, I am starting to run out of ideas, so any pointers
or tips would be greatly appreciated.

With OpenWRT, I based the dts for the U7623 on mt7623-eMMC.dts. Since
this file is not available in the mainline kernel, I decided to use
the DTS for Banana Pi R2 as the boards seem fairly similar (and the
initial goal is just to have a kernel that boots). I got a 4.14 config
from a repo I found on the BPI-forum
(https://github.com/frank-w/BPI-R2-4.14), added missing config symbols
for 4.15, compiled a kernel and appended the dtb to the uImage. So
far, so good and the kernel compiles just fine.

When booting the kernel (from the eMMC), the trouble starts. The
kernel seems to be loaded just fine, but after "Starting kernel ..."
nothing more is written to the screen. I.e., I see the following:

bootm flag=0, states=70f
## Booting kernel from Legacy Image at 84000000 ...
   Image Name:   Linux Kernel 4.14.18-main
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    5891369 Bytes = 5.6 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK

Starting kernel ...

I had a similar error when working on getting OpenWRT to run on the
board, but then it was caused by the dtb not being appended to the
kernel. When looking around online for reasons for this error, missing
dtb or config-mistakes seems to be the two main reasons. I have
checked for misses and errors in dts and config (both compared to the
datasheet and my working 4.9 kernel), but haven't really found
anything. And the changes I have made have had no effect.

Does anyone have any idea about what could be wrong or where I should look?

Thanks in advance for any help,
Kristian
